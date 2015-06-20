# The run_analysis.R script is in partial fulfillment of the Course Project 
# for the Coursera "Getting and Cleaning Data" course.
#
# The script downloads the Human Activity Recognition dataset, tidies 
# it up, and performs various required data manipulations and summaries.

# 1. Load dplyr
if (!require("dplyr")) {
    message("Installing dplyr")
    install.packages("dplyr")
}

# 2. Create project data directory
if (!file.exists("./Data")) 
{
    message("Creating data directory")
    dir.create("./Data")
}

# 3. Download Human Activity Recognition dataset
if (!file.exists("./Data/UCI_HAR_Dataset.zip")) 
{
    message("Downloading dataset")
    download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", 
                  destfile = "./Data/UCI_HAR_Dataset.zip", 
                  method = "internal",
                  mode = "wb")
}

# 4. Extract Human Activity Recognition dataset
if (!file.exists("./Data/UCI HAR Dataset")) 
{
    message("Extracting dataset")
    unzip("./Data/UCI_HAR_Dataset.zip", 
          overwrite = FALSE, 
          exdir = "./Data")
}

# 5. Load the features
#   5.1 Identify the mean() and std() features
#   5.2 Create syntactically valid variable names from the features 
#       to be used as column names for the training and test datasets
features <- tbl_df(
    read.table("./Data/UCI HAR Dataset/features.txt", 
               col.names = c("Id", "Feature")))

features <- features %>% 
    mutate(Is.Mean = grepl("mean\\(\\)", features$Feature)) %>%
    mutate(Is.Std = grepl("std\\(\\)", features$Feature)) %>%
    mutate(Feature.Variable = make.names(features$Feature, unique = TRUE)) %>%
    mutate(Feature.Variable = gsub("^t", "Time.", Feature.Variable)) %>%
    mutate(Feature.Variable = gsub("\\.t", ".Time.", Feature.Variable)) %>%
    mutate(Feature.Variable = gsub("^f", "Frequency.", Feature.Variable)) %>%
    mutate(Feature.Variable = gsub("\\.f", ".Frequency.", Feature.Variable)) %>%
    mutate(Feature.Variable = gsub("^angle\\.", "Angle.", Feature.Variable)) %>%
    mutate(Feature.Variable = gsub("BodyBody", "Body", Feature.Variable)) %>%
    mutate(Feature.Variable = gsub("Acc", ".Acc", Feature.Variable)) %>%
    mutate(Feature.Variable = gsub("Gyro", ".Gyro", Feature.Variable)) %>%
    mutate(Feature.Variable = gsub("Jerk", ".Jerk", Feature.Variable)) %>%
    mutate(Feature.Variable = gsub("Mag", ".Mag", Feature.Variable)) %>%
    mutate(Feature.Variable = gsub("\\.\\.", ".", Feature.Variable)) %>%
    mutate(Feature.Variable = gsub("\\.\\.", ".", Feature.Variable)) %>%
    mutate(Feature.Variable = gsub("\\.$", "", Feature.Variable)) %>%
    mutate(Feature.Variable = gsub("(^|[\\.])([[:alpha:]])", "\\1\\U\\2", 
                    Feature.Variable, perl=TRUE))

# 6. Load activities
activities <- tbl_df(
    read.table("./Data/UCI HAR Dataset/activity_labels.txt", 
               col.names = c("Id", "Activity")))

# 7. Load the training dataset
#   7.1 Add training data column names from features
#   7.2 Add subject data, and activity data to the training dataset
train <- tbl_df(read.table("./Data/UCI HAR Dataset/train/X_train.txt"))
colnames(train) <- features$Feature.Variable
train <- cbind(
        rename(tbl_df(read.table("./Data/UCI HAR Dataset/train/subject_train.txt")), 
               Subject.Id = V1),
        rename(tbl_df(read.table("./Data/UCI HAR Dataset/train/y_train.txt")),
               Activity.Id = V1),
        Dataset.Partition = c("Training"),
        train)

# 8. Load the test dataset
#   8.1 Add test data column names from features
#   8.2 Add subject data, and activity data to the test dataset
test <- tbl_df(read.table("./Data/UCI HAR Dataset/test/X_test.txt"))
colnames(test) <- features$Feature.Variable
test <- cbind(
    rename(tbl_df(read.table("./Data/UCI HAR Dataset/test/subject_test.txt")), 
           Subject.Id = V1),
    rename(tbl_df(read.table("./Data/UCI HAR Dataset/test/y_test.txt")),
           Activity.Id = V1),
    Dataset.Partition = c("Test"),
    test)

# 9. Merge the training and test datasets
#   9.1 Add descriptive activity names from activities 
#   9.2 Select the mean and std deviation features only
#   9.3 Group by subject and activity
merged <- rbind(train, test) %>%
    left_join(activities, by = c("Activity.Id" = "Id")) %>%
    select(Subject.Id, Activity,   
           one_of(
               filter(features, Is.Mean == TRUE | Is.Std == TRUE) %>%
                   select(Feature.Variable) %>% .[["Feature.Variable"]])) %>%
    group_by(Subject.Id, Activity)

# 10. Create a tidy summary of feature means grouped by subject and activity
tidy_summary <- summarise_each(merged, funs(mean))

# 11. Write tidy summary to file
write.table(tidy_summary, "tidy_summary.txt", row.names = FALSE)
