---
title: "Getting and Cleaning Data Course Project"
author: "Manoj Raheja"
date: "Saturday, January 24, 2015"
output: html_document
---
---
title: "Getting and Cleaning Data Course Project Help"
author: "Manoj Raheja"
date: "Saturday, January 24, 2015"
---
**Summary**
This code book describes the variables, the data, and any transformations or work that was performed to clean up the data 

**Data source**
Human Activity Recognition Using Smartphones Data Set
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

**Data location**
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

**Transformation & Steps performed to clean this data:**

**Loading & merging**

Loaded  data from below files into R tables and murged the training and test data sets 
 - features.txt
 - activity_labels.txt
 - subject_train.txt
 - x_train.txt
 - y_train.txt
 - subject_test.txt
 - x_test.txt
 - y_test.txt
 
 
**Labeled the columns**

Label the columns of all data set and used grep function to get the indices of columns to filter the columns. Output was stored in mean_std_data
 
**Labeled the reference data and added to the data set**

Uses descriptive activity names to name the activities in the data set and appropriately labels the data set with descriptive variable names. 

**Produce second data set** 
By generating average of each variable for each activity and each subject.

**Finally save output**
Saved the output to text files.
