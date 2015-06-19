# This script is in partial fulfilment of the course project for the 
# Coursera "Getting and Cleaning Data" course.
#
# This script downloads the Human Activity Recognition dataset, tidies 
# it up, and performs various required data summaries and manipulations.
#
# The script assumes it is being executed in the R working directory

# Create project data directory
if (!file.exists("./Data")) dir.create("./Data")

# Download Human Activity Recognition dataset
if (!file.exists("./Data/UCI_HAR_Dataset.zip")) 
    download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", 
                  destfile = "./Data/UCI_HAR_Dataset.zip", 
                  method = "internal",
                  mode = "wb")

# Extract data files
unzip("./Data/UCI_HAR_Dataset.zip", overwrite = FALSE, exdir = "./Data")


