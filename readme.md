#Coursera - Getting and Cleaning Data - Course Project

This repository is for the **Course Project** of the 
**<a href="https://www.coursera.org/course/getdata" target="_blank">Coursera Getting and Cleaning Data</a>** course.

The purpose of the project was for individuals to demonstrate their ability to collect, work with, clean, summarize, and document a dataset. 

The **<a href="http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones" target="_blank">Human Activity Recognition Using Smartphones Data Set (HAR)</a>** was provided from the **Machine Learning Repository** of UCI, with the following instructions:

1. Create a tidy dataset using R
    1. Create a script called [run_analysis.R](run_analysis.R) that:
        1. Merges the training and the test sets into one dataset.
        2. Extracts the measurements on the mean and standard deviation for each measurement.
        3. Uses descriptive activity names to name the activities in the dataset.
        4. Appropriately labels the dataset with descriptive variable names.
        5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
    2. Upload the [run_analysis.R](run_analysis.R) to a Github repository
2. Create a code book that describes the variables, the data, and any transformations or manipulations performed to tidy and summarize the data.
    1. Call the code book file [codebook.md](codebook.md), and upload to the same Github repository as the run_analysis.R script.
3. Create a repository [readme.md](readme.md) in the repository that explains the repository.

## Repository contents and structure
The repository is structured as follows:

* **[/Data](Data)** - Contains the HAR dataset 
* **[/Data/UCI HAR Dataset](/Data/UCI HAR Dataset)** - Contains the extracted HAR dataset 
* **[UCI_HAR_Dataset.zip](UCI_HAR_Dataset.zip)** - is the zip archive of the HAR dataset 
* **[Human Activity Recognition Using Smartphones Data Set.Rproj](Human Activity Recognition Using Smartphones Data Set.Rproj)** - is the RStudio project file
* **[codebook.md](codebook.md)** - is the code book describing the dataset
* **[readme.md](readme.md)** - well you know what that is .....
* **[run_analysis.R](run_analysis.R)** - is the R script that downloads, shapes, tidies, and summarizes the Har dataset

## Process of tidying and summarizing the HAR dataset
The [run_analysis.R](run_analysis.R) script downloads the HAR dataset, tidies it, performs various required data manipulations, and summaries it. The script flow is as follows:

1. Load required libraries (i.e. dplyr)
2. Create the project data directory
3. Download the HAR dataset to the project data directory
4. Extract Human Activity Recognition dataset in the project data directory
5. Load the features from the HAR dataset
    1. Identify the mean() and std() features
    2. Create syntactically valid variable names from the feature names. These are used as column names for the training and test datasets.
6. Load the activities from the HAR dataset
7. Load the HAR training dataset
    1. Add the training data column names from the syntactically valid feature names created in step 5.2
    2. Add the subject identifiers, and activity identifiers to the training dataset
8. Load the HAR test dataset
    1. Add the test data column names from the syntactically valid feature names created in step 5.2
    2. Add the subject identifiers, and activity identifiers to the test dataset
9. Merge the training and test datasets
    1. Add descriptive activity names from the activities loaded in step 6
    2. Select the mean and std deviation features from the mean and std features identified in step 5.1
    3. Group the merged data by subject and activity
10. Create a tidy summary of feature means grouped by subject and activity
11. Write the tidy summary to file

## Code Book
The [codebook.md](codebook.md) describes the parts of the HAR dataset that are manipulated and summarized.
