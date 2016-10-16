

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
* trainIn - combine trainIn_sub, trainIn_Y and trainIn_X (in that other)  
## Processing Tables  
* combData
* cols_m
* cols_s
* extractData
* namedData
* colsToAgg
* meltData
* dataOut
