# This script was used to generate descriptions for the variables in the 
# tidy_summary.txt output of the run_analysis.R script. These descriptions
# are used int he dataset code book.
require(plyr)
library(dplyr)

# A function that takes in a variable name and generates a description for the
# variable
generateVariableDescription <- function(x) {
    x <- as.character(x)
    desc <- ""
    
    if (x == "Activity")
        desc <- paste(desc, "The motion activity" , sep = "")
    
    if (x == "Subject.Id")
        desc <- paste(desc, "The subject identifier" , sep = "")
    
    if (grepl("\\.mean", x, ignore.case = TRUE)[1] == TRUE) 
        desc <- paste(desc, "The mean of " , sep = "")
    
    if (grepl("\\.std", x, ignore.case = TRUE)[1] == TRUE) 
        desc <- paste(desc, "The standard deviation of ", sep = "")
    
    if (grepl("frequency\\.", x, ignore.case = TRUE)[1] == TRUE) {
        desc <- paste(desc, "a Fourier transformed ", sep = "")
        if (grepl("mag\\.", x, ignore.case = TRUE)[1] == TRUE) {
            desc <- paste(desc, "resultant XYZ signal (Euclidean norm) ", sep = "")
        } else if (grepl("\\.x", x, ignore.case = TRUE)[1] == TRUE) {
            desc <- paste(desc, "X signal ", sep = "")
        } else if (grepl("\\.y", x, ignore.case = TRUE)[1] == TRUE) {
            desc <- paste(desc, "Y signal ", sep = "")
        } else if (grepl("\\.z", x, ignore.case = TRUE)[1] == TRUE) {
            desc <- paste(desc, "Z signal ", sep = "")
        }
    } else {
        if (grepl("mag\\.", x, ignore.case = TRUE)[1] == TRUE) {
            desc <- paste(desc, "the resultant XYZ ", sep = "")
        } else if (grepl("\\.x", x, ignore.case = TRUE)[1] == TRUE) {
            desc <- paste(desc, "the X ", sep = "")
        } else if (grepl("\\.y", x, ignore.case = TRUE)[1] == TRUE) {
            desc <- paste(desc, "the Y ", sep = "")
        } else if (grepl("\\.z", x, ignore.case = TRUE)[1] == TRUE) {
            desc <- paste(desc, "the Z ", sep = "")
        }
    }
    
    if (grepl("jerk\\.", x, ignore.case = TRUE)[1] == TRUE) {
        if (grepl("acc\\.", x, ignore.case = TRUE)[1] == TRUE)
            desc <- paste(desc, "jerk from an accelerometer signal ", sep = "")
        
        if (grepl("gyro\\.", x, ignore.case = TRUE)[1] == TRUE)
            desc <- paste(desc, "jerk from a gyroscope signal ", sep = "")
    }
    else {
        if (grepl("acc\\.", x, ignore.case = TRUE)[1] == TRUE)
            desc <- paste(desc, "acceleration from an accelerometer signal ", sep = "")
        
        if (grepl("gyro\\.", x, ignore.case = TRUE)[1] == TRUE)
            desc <- paste(desc, "angular velocity from a gyroscope signal ", sep = "")
    }
    
    if (grepl("\\.body", x, ignore.case = TRUE)[1] == TRUE) 
        desc <- paste(desc, "related to body motion", sep = "") 
    
    if (grepl("\\.gravity", x, ignore.case = TRUE)[1] == TRUE) 
        desc <- paste(desc, "related gravity", sep = "") 
    
    desc
}

# 1. Read the variable names from the tidy_summary.txt file
tidy_summary_variables <- read.table("tidy_summary.txt", header = TRUE) %>%
    names %>%
    data.frame %>%
    tbl_df %>%
    plyr::rename(c("." ="Variable"))

# 2. Generate a list of descriptions related to the variable names
descriptions <- data.frame(
    tapply(tidy_summary_variables$Variable, 
           tidy_summary_variables[1], 
           generateVariableDescription))

# 3. Rename the descriptions column to Description
colnames(descriptions)[1] <- "Description"

# 4. Add the row names of the descriptions as the variable name
descriptions <- cbind(Variable = rownames(descriptions), descriptions)

# 5. Output the variable names and descriptions to file
write.table(descriptions, "variable_descriptions.txt", row.names = FALSE)