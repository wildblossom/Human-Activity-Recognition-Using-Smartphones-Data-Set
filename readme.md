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
* **[/Data/UCI HAR Dataset](Data/UCI HAR Dataset)** - Contains the extracted HAR dataset 
* **[/Data/UCI_HAR_Dataset.zip](Data/UCI_HAR_Dataset.zip)** - is the zip archive of the HAR dataset 
* **[Human Activity Recognition Using Smartphones Data Set.Rproj](Human Activity Recognition Using Smartphones Data Set.Rproj)** - is the RStudio project file
* **[codebook.md](codebook.md)** - is the code book describing the dataset
* **[readme.md](readme.md)** - well you know what that is .....
* **[run_analysis.R](run_analysis.R)** - is the R script that downloads, shapes, tidies, and summarizes the Har dataset

## Process of tidying and summarizing the HAR dataset
The [run_analysis.R](run_analysis.R) script downloads the HAR dataset, tidies it, performs various required data manipulations, and summaries it. The script flow is described in the [Code Book](codebook.md)

## Code Book
The [Code Book](codebook.md) describes the parts of the HAR dataset that are manipulated and summarized.
