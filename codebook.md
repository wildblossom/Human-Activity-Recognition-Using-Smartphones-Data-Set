#Human Activity Recognition Using Smartphones Data Set - Code book
* Published on **20 June 2015**
* Based on UCI **Machine Learning Repository** **<a href="http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones" target="_blank">Human Activity Recognition Using Smartphones Data Set (HRA)</a>**

## Human Activity Recognition Using Smartphones Dataset description
See **Data/UCI HAR Dataset/README.txt** for a description of the UCI HAR dataset.

## Data files used
The following UCI HAR data files were used in fulfilling the requirements of the course project:

* activity_labels.txt - Which links the class labels with their activity name.
* features.txt - Which lists all features, and is used to identify the dataset data columns.
* test/subject_test.txt - Which identifies the subject that performed the test activity for each window sample.
* test/X_test.txt - Which contains the test dataset.
* test/y_test.txt - Which contains the test dataset labels, used to identify the activity performed for each window sample. Labels are linked to data in activity_labels.txt.
* train/subject_train.txt - Which identifies the subject that performed the training activity for each window sample.
* train/X_train.txt - Which contains the training dataset.
* train/y_train.txt - Which contains the training dataset labels, used to identify the activity performed for each window sample. Labels are linked to data in activity_labels.txt.

## Data processing, tidying, and summarizing
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

## Tidy Summary File
The tidy file output at the end of the [run_analysis.R](run_analysis.R) script can be found here [tidy_summary.txt](tidy_summary.txt).
The file comprises 68 variables with 180 rows, and there are no missing data.
NOTE: The variable data other than the identifiers are all the mean of the original data.

## Variable descriptions
The descriptions of the variables in the [tidy_summary.txt](tidy_summary.txt) file.

### Identifiers
* **Activity** - The motion activity
* **Subject.Id** - The subject identifier

### Frequency domain variables
* **Frequency.Body.Acc.Jerk.Mag.Mean** - The mean of a Fourier transformed resultant XYZ signal (Euclidean norm) jerk from an accelerometer signal related to body motion
* **Frequency.Body.Acc.Jerk.Mag.Std** - The standard deviation of a Fourier transformed resultant XYZ signal (Euclidean norm) jerk from an accelerometer signal related to body motion
* **Frequency.Body.Acc.Jerk.Mean.X** - The mean of a Fourier transformed X signal jerk from an accelerometer signal related to body motion
* **Frequency.Body.Acc.Jerk.Mean.Y** - The mean of a Fourier transformed Y signal jerk from an accelerometer signal related to body motion
* **Frequency.Body.Acc.Jerk.Mean.Z** - The mean of a Fourier transformed Z signal jerk from an accelerometer signal related to body motion
* **Frequency.Body.Acc.Jerk.Std.X** - The standard deviation of a Fourier transformed X signal jerk from an accelerometer signal related to body motion
* **Frequency.Body.Acc.Jerk.Std.Y** - The standard deviation of a Fourier transformed Y signal jerk from an accelerometer signal related to body motion
* **Frequency.Body.Acc.Jerk.Std.Z** - The standard deviation of a Fourier transformed Z signal jerk from an accelerometer signal related to body motion
* **Frequency.Body.Acc.Mag.Mean** - The mean of a Fourier transformed resultant XYZ signal (Euclidean norm) acceleration from an accelerometer signal related to body motion
* **Frequency.Body.Acc.Mag.Std** - The standard deviation of a Fourier transformed resultant XYZ signal (Euclidean norm) acceleration from an accelerometer signal related to body motion
* **Frequency.Body.Acc.Mean.X** - The mean of a Fourier transformed X signal acceleration from an accelerometer signal related to body motion
* **Frequency.Body.Acc.Mean.Y** - The mean of a Fourier transformed Y signal acceleration from an accelerometer signal related to body motion
* **Frequency.Body.Acc.Mean.Z** - The mean of a Fourier transformed Z signal acceleration from an accelerometer signal related to body motion
* **Frequency.Body.Acc.Std.X** - The standard deviation of a Fourier transformed X signal acceleration from an accelerometer signal related to body motion
* **Frequency.Body.Acc.Std.Y** - The standard deviation of a Fourier transformed Y signal acceleration from an accelerometer signal related to body motion
* **Frequency.Body.Acc.Std.Z** - The standard deviation of a Fourier transformed Z signal acceleration from an accelerometer signal related to body motion
* **Frequency.Body.Gyro.Jerk.Mag.Mean** - The mean of a Fourier transformed resultant XYZ signal (Euclidean norm) jerk from a gyroscope signal related to body motion
* **Frequency.Body.Gyro.Jerk.Mag.Std** - The standard deviation of a Fourier transformed resultant XYZ signal (Euclidean norm) jerk from a gyroscope signal related to body motion
* **Frequency.Body.Gyro.Mag.Mean** - The mean of a Fourier transformed resultant XYZ signal (Euclidean norm) angular velocity from a gyroscope signal related to body motion
* **Frequency.Body.Gyro.Mag.Std** - The standard deviation of a Fourier transformed resultant XYZ signal (Euclidean norm) angular velocity from a gyroscope signal related to body motion
* **Frequency.Body.Gyro.Mean.X** - The mean of a Fourier transformed X signal angular velocity from a gyroscope signal related to body motion
* **Frequency.Body.Gyro.Mean.Y** - The mean of a Fourier transformed Y signal angular velocity from a gyroscope signal related to body motion
* **Frequency.Body.Gyro.Mean.Z** - The mean of a Fourier transformed Z signal angular velocity from a gyroscope signal related to body motion
* **Frequency.Body.Gyro.Std.X** - The standard deviation of a Fourier transformed X signal angular velocity from a gyroscope signal related to body motion
* **Frequency.Body.Gyro.Std.Y** - The standard deviation of a Fourier transformed Y signal angular velocity from a gyroscope signal related to body motion
* **Frequency.Body.Gyro.Std.Z** - The standard deviation of a Fourier transformed Z signal angular velocity from a gyroscope signal related to body motion

### Time domain variables
* **Time.Body.Acc.Jerk.Mag.Mean** - The mean of the resultant XYZ jerk from an accelerometer signal related to body motion
* **Time.Body.Acc.Jerk.Mag.Std** - The standard deviation of the resultant XYZ jerk from an accelerometer signal related to body motion
* **Time.Body.Acc.Jerk.Mean.X** - The mean of the X jerk from an accelerometer signal related to body motion
* **Time.Body.Acc.Jerk.Mean.Y** - The mean of the Y jerk from an accelerometer signal related to body motion
* **Time.Body.Acc.Jerk.Mean.Z** - The mean of the Z jerk from an accelerometer signal related to body motion
* **Time.Body.Acc.Jerk.Std.X** - The standard deviation of the X jerk from an accelerometer signal related to body motion
* **Time.Body.Acc.Jerk.Std.Y** - The standard deviation of the Y jerk from an accelerometer signal related to body motion
* **Time.Body.Acc.Jerk.Std.Z** - The standard deviation of the Z jerk from an accelerometer signal related to body motion
* **Time.Body.Acc.Mag.Mean** - The mean of the resultant XYZ acceleration from an accelerometer signal related to body motion
* **Time.Body.Acc.Mag.Std** - The standard deviation of the resultant XYZ acceleration from an accelerometer signal related to body motion
* **Time.Body.Acc.Mean.X** - The mean of the X acceleration from an accelerometer signal related to body motion
* **Time.Body.Acc.Mean.Y** - The mean of the Y acceleration from an accelerometer signal related to body motion
* **Time.Body.Acc.Mean.Z** - The mean of the Z acceleration from an accelerometer signal related to body motion
* **Time.Body.Acc.Std.X** - The standard deviation of the X acceleration from an accelerometer signal related to body motion
* **Time.Body.Acc.Std.Y** - The standard deviation of the Y acceleration from an accelerometer signal related to body motion
* **Time.Body.Acc.Std.Z** - The standard deviation of the Z acceleration from an accelerometer signal related to body motion
* **Time.Body.Gyro.Jerk.Mag.Mean** - The mean of the resultant XYZ jerk from a gyroscope signal related to body motion
* **Time.Body.Gyro.Jerk.Mag.Std** - The standard deviation of the resultant XYZ jerk from a gyroscope signal related to body motion
* **Time.Body.Gyro.Jerk.Mean.X** - The mean of the X jerk from a gyroscope signal related to body motion
* **Time.Body.Gyro.Jerk.Mean.Y** - The mean of the Y jerk from a gyroscope signal related to body motion
* **Time.Body.Gyro.Jerk.Mean.Z** - The mean of the Z jerk from a gyroscope signal related to body motion
* **Time.Body.Gyro.Jerk.Std.X** - The standard deviation of the X jerk from a gyroscope signal related to body motion
* **Time.Body.Gyro.Jerk.Std.Y** - The standard deviation of the Y jerk from a gyroscope signal related to body motion
* **Time.Body.Gyro.Jerk.Std.Z** - The standard deviation of the Z jerk from a gyroscope signal related to body motion
* **Time.Body.Gyro.Mag.Mean** - The mean of the resultant XYZ angular velocity from a gyroscope signal related to body motion
* **Time.Body.Gyro.Mag.Std** - The standard deviation of the resultant XYZ angular velocity from a gyroscope signal related to body motion
* **Time.Body.Gyro.Mean.X** - The mean of the X angular velocity from a gyroscope signal related to body motion
* **Time.Body.Gyro.Mean.Y** - The mean of the Y angular velocity from a gyroscope signal related to body motion
* **Time.Body.Gyro.Mean.Z** - The mean of the Z angular velocity from a gyroscope signal related to body motion
* **Time.Body.Gyro.Std.X** - The standard deviation of the X angular velocity from a gyroscope signal related to body motion
* **Time.Body.Gyro.Std.Y** - The standard deviation of the Y angular velocity from a gyroscope signal related to body motion
* **Time.Body.Gyro.Std.Z** - The standard deviation of the Z angular velocity from a gyroscope signal related to body motion
* **Time.Gravity.Acc.Mag.Mean** - The mean of the resultant XYZ acceleration from an accelerometer signal related gravity
* **Time.Gravity.Acc.Mag.Std** - The standard deviation of the resultant XYZ acceleration from an accelerometer signal related gravity
* **Time.Gravity.Acc.Mean.X** - The mean of the X acceleration from an accelerometer signal related gravity
* **Time.Gravity.Acc.Mean.Y** - The mean of the Y acceleration from an accelerometer signal related gravity
* **Time.Gravity.Acc.Mean.Z** - The mean of the Z acceleration from an accelerometer signal related gravity
* **Time.Gravity.Acc.Std.X** - The standard deviation of the X acceleration from an accelerometer signal related gravity
* **Time.Gravity.Acc.Std.Y** - The standard deviation of the Y acceleration from an accelerometer signal related gravity
* **Time.Gravity.Acc.Std.Z** - The standard deviation of the Z acceleration from an accelerometer signal related gravity
