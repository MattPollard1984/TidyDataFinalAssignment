

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

* featureNames
* activityNames

* trainIn_X
* trainIn_Y
* trainIn_sub
* trainIn

* testIn_X
* testIn_Y
* testIn_sub
* testIn

* combData

* cols_m
* cols_s

* extractData
* namedData

* colsToAgg
* meltData
* dataOut
