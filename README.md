# Getting-and-Cleaning-Data


## Purpose

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.  

The created R script called run_analysis.R should do the followings: 

    Merges the training and the test sets to create one data set.
    Extracts only the measurements on the mean and standard deviation for each measurement. 
    Uses descriptive activity names to name the activities in the data set
    Appropriately labels the data set with descriptive variable names. 

    From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


##About the program: run_analysis.R

    The program downloads the UCI HAR Dataset data set and stores the zip file in the working directrory. The the zip file is decompressed into the same directory. 
    d, it unzips the file into the UCI HAR Dataset folder.
    It loads the train and test data sets and merges the two datasets into one data frame.
    The mean and standard deviation are calculated based on the features data set which is read from the features.txt file.
    The column names are replaced with the descriptive activitiy names in the data set. 
    The three data sets, x, y and subj, are merged and the file "merged.txt" is generated in the same working directory. 
    Finally, a file named "average.txt" including the  mean values of activities and subjects is produced. 

