# TidyDataFinalAssignment
Coursera Tidy Data Course - Final Assignment

All processing included in run_analysis.r

# Libraries required
dplyr
reshapre

# Processes
1. Set up Libraries
2. Read in feature names from "features.txt"
3. Read in activity names from "activity_labels.txt"
4. Read in TRAIN data 
  + subject ID from "subject_train.txt"
  + activity ID from "Y_train.txt"
  + actual data from "X_train.txt"
5. Read in TEST data 
  + subject ID from "subject_test.txt"
  + activity ID from "Y_test.txt"
  + actual data from "X_test.txt"
6. Combine TRAIN and TEST data into one dataset
7. Get only columns that relate to the mean or standard deviation of a variable
  + This includes for example fBodyBodyGyroJerkMag-meanFreq() as it is the mean of the Frequency components of the fBodyBodyGyroJerkMag variable
8. Add the Activity Name (as text) to the data frame
9. Aggregate data to subjectID and activityID using melt and dcast
10. Write table out to text file

#Other
The code to read the table back into R is as follows:
readBackIn <- read.table("step5_output_table.txt", header = TRUE)
