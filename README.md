Coursera-Getting-and-Cleaning-Data
==================================

Repository for Coursera course:Getting and Cleaning Data

This is course project for Coursera Course:Getting and Cleaning Data

## Course Project Guidelines (provided by Professor)

You should create one R script called run_analysis.R that does the following.

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive activity names.
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Steps to work on this course project

1)Download the data source and unzip. Copy the contents of  ```UCI HAR Dataset``` folder into Coursera directory where run_analysis.R is located. 

[mpattan-mba13:~/Google Drive/RPrograms/Coursera] mpattan% pwd

/Users/mpattan/Google Drive/RPrograms/Coursera

[mpattan-mba13:~/Google Drive/RPrograms/Coursera] mpattan% ls

README.txt		features.txt		run_analysis.R		tidyData.txt
activity_labels.txt	features_info.txt	test			train

[mpattan-mba13:~/Google Drive/RPrograms/Coursera] mpattan% 

2)Set working directory to  directory containing run_analysis.R. This workign directory will also contain data set downloaded in step #1 above. 

Run ```source("run_analysis.R")```, then it will generate a new file ```tidyData.txt``` in your working directory.

## Dependencies

```run_analysis.R``` file will require the libraries - reshape and data.table. If these libarries arne't installed, please install these libraries before running the script. 
