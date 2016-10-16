

# Input Files 

Downloaded from here:  
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  

activity_labels.txt - lookup between activity ID and descriptive name.  
features_info.txt - description of the measurements available, processes in collectiing and calculating them.  
features.txt - full list of all the measurements/features in the dataset.  
README.txt - details on the data.  

Plus two folders - TRAIN and TEST - each containing (where XXXX is TRAIN or TEST)  

* subject_XXXX.txt - list of SubjectIDs for the dataset.  
* Y_XXXX.txt - list of ActivityIDs for the dataset.  
* X_XXXX.txt - actual data - 561 columns, each matching the corresponding feature in features.txt.   

# Tables Created In Scripts

## Dimension Tables
* featureNames 
  + read in "features.txt"
  + rename columns to "featureID" and "featureName"
* activityNames
  + read in "activity_labels.txt"
  + rename columns to "actID" and "activityName"
  
## Train Input Data
* trainIn_X 
  + read in "train\X_train.txt"
  + rename columns to be same as data stored in featureNames$featureName
* trainIn_Y
  + read in "train\Y_train.txt"
  + rename column to be "activityID"
* trainIn_sub
  + read in "train\subject_train.txt"
  + renamecolumn to be "subjectID"
* trainIn - combine trainIn_sub, trainIn_Y and trainIn_X (in that other)  

## Test Input Data
* testIn_X 
  + read in "test\X_test.txt"
  + rename columns to be same as data stored in featureNames$featureName
* testIn_Y
  + read in "test\Y_test.txt"
  + rename column to be "activityID"
* testIn_sub
  + read in "test\subject_test.txt"
  + renamecolumn to be "subjectID"
* testIn - combine testIn_sub, testIn_Y and testIn_X (in that other)  

## Processing Tables  
* combData - combine trainIn and testIn using rbind
* cols_m - get true/false list of columns from combData that contain "-mode()"
  + columns 1 and 2 are set to be TRUE so there are included in the extraction, as they are subjectID and activityID
* cols_s - get true/false list of columns from combData that contain "-std()"
* extractData - extract the columns containing "-mode()" or "-std()" from combData
* namedData - join extractData to activityNames table to get the descriptive activityName data
* colsToAgg - list of columns in namedData. Used in the calculation of the mean to select appropriate columns
* meltData - melt namedData to be by ActivityID, SubjectID (and ActivityName)
* dataOut - calculate mean of all variables by ActivityID and SubjectID (and ActivityName) 

# Output Files

One output file is created: step5_output_table.txt  

This contains the contents of dataOut and is created via:  
write.table(dataOut, "step5_output_table.txt", row.name=FALSE)

