## Create one R script called run_analysis.R that does the following:
## 1. Merges the training and the test sets to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation for each measurement.
## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive activity names.
## 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

require("data.table")
require("reshape2")

# Load: activity labels
activity_labels <- read.table("./activity_labels.txt")[,2]

# Load: data column names
features <- read.table("./features.txt")[,2]

# Extract only the measurements on the mean and standard deviation for each measurement.
extract_features <- grepl("mean|std", features)

# Load and process xTest & yTest data.
xTest <- read.table("./test/X_test.txt")
yTest <- read.table("./test/y_test.txt")
subjectTest <- read.table("./test/subject_test.txt")

names(xTest) = features

# Extract only the measurements on the mean and standard deviation for each measurement.
xTest = xTest[,extract_features]

# Load activity labels
yTest[,2] = activity_labels[yTest[,1]]
names(yTest) = c("Activity_ID", "Activity_Label")
names(subjectTest) = "subject"

# Bind data
test_data <- cbind(as.data.table(subjectTest), yTest, xTest)

# Load and process xTrain & yTrain data.
xTrain <- read.table("./train/X_train.txt")
yTrain <- read.table("./train/y_train.txt")

subject_train <- read.table("./train/subject_train.txt")

names(xTrain) = features

# Extract only the measurements on the mean and standard deviation for each measurement.
xTrain = xTrain[,extract_features]

# Load activity data
yTrain[,2] = activity_labels[yTrain[,1]]
names(yTrain) = c("Activity_ID", "Activity_Label")
names(subject_train) = "subject"

# Bind data
train_data <- cbind(as.data.table(subject_train), yTrain, xTrain)

# Merge test and train data
data = rbind(test_data, train_data)

idLabels   = c("subject", "Activity_ID", "Activity_Label")
dataLabels = setdiff(colnames(data), idLabels)
meltData      = melt(data, id = idLabels, measure.vars = dataLabels)

# Apply mean function to dataset using dcast function
tidyData   = dcast(meltData, subject + Activity_Label ~ variable, mean)

write.table(tidyData, file = "./tidyData.txt")
