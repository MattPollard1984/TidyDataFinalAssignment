

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

### Dimension Tables
* featureNames 
  + read in "features.txt"
  + rename columns to "featureID" and "featureName"
* activityNames
  + read in "activity_labels.txt"
  + rename columns to "actID" and "activityName"
  
### Train Input Data
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

### Test Input Data
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

### Processing Tables  
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

The output column headings in this data are  
* activityID
* activityName
* subjectID
* followed by the 82 elemeants in "features.txt" that contain either the text "-mean()" or "-std()"

A full list of columns is given below.  

 [1] "activityID"                     
 [2] "activityName"                   
 [3] "subjectID"                      
 [4] "tBodyAcc-mean()-X"              
 [5] "tBodyAcc-mean()-Y"              
 [6] "tBodyAcc-mean()-Z"              
 [7] "tBodyAcc-std()-X"               
 [8] "tBodyAcc-std()-Y"               
 [9] "tBodyAcc-std()-Z"               
[10] "tGravityAcc-mean()-X"           
[11] "tGravityAcc-mean()-Y"           
[12] "tGravityAcc-mean()-Z"           
[13] "tGravityAcc-std()-X"            
[14] "tGravityAcc-std()-Y"            
[15] "tGravityAcc-std()-Z"            
[16] "tBodyAccJerk-mean()-X"          
[17] "tBodyAccJerk-mean()-Y"          
[18] "tBodyAccJerk-mean()-Z"          
[19] "tBodyAccJerk-std()-X"           
[20] "tBodyAccJerk-std()-Y"           
[21] "tBodyAccJerk-std()-Z"           
[22] "tBodyGyro-mean()-X"             
[23] "tBodyGyro-mean()-Y"             
[24] "tBodyGyro-mean()-Z"             
[25] "tBodyGyro-std()-X"              
[26] "tBodyGyro-std()-Y"              
[27] "tBodyGyro-std()-Z"              
[28] "tBodyGyroJerk-mean()-X"         
[29] "tBodyGyroJerk-mean()-Y"         
[30] "tBodyGyroJerk-mean()-Z"         
[31] "tBodyGyroJerk-std()-X"          
[32] "tBodyGyroJerk-std()-Y"          
[33] "tBodyGyroJerk-std()-Z"          
[34] "tBodyAccMag-mean()"             
[35] "tBodyAccMag-std()"              
[36] "tGravityAccMag-mean()"          
[37] "tGravityAccMag-std()"           
[38] "tBodyAccJerkMag-mean()"         
[39] "tBodyAccJerkMag-std()"          
[40] "tBodyGyroMag-mean()"            
[41] "tBodyGyroMag-std()"             
[42] "tBodyGyroJerkMag-mean()"        
[43] "tBodyGyroJerkMag-std()"         
[44] "fBodyAcc-mean()-X"              
[45] "fBodyAcc-mean()-Y"              
[46] "fBodyAcc-mean()-Z"              
[47] "fBodyAcc-std()-X"               
[48] "fBodyAcc-std()-Y"               
[49] "fBodyAcc-std()-Z"               
[50] "fBodyAcc-meanFreq()-X"          
[51] "fBodyAcc-meanFreq()-Y"          
[52] "fBodyAcc-meanFreq()-Z"          
[53] "fBodyAccJerk-mean()-X"          
[54] "fBodyAccJerk-mean()-Y"          
[55] "fBodyAccJerk-mean()-Z"          
[56] "fBodyAccJerk-std()-X"           
[57] "fBodyAccJerk-std()-Y"           
[58] "fBodyAccJerk-std()-Z"           
[59] "fBodyAccJerk-meanFreq()-X"      
[60] "fBodyAccJerk-meanFreq()-Y"      
[61] "fBodyAccJerk-meanFreq()-Z"      
[62] "fBodyGyro-mean()-X"             
[63] "fBodyGyro-mean()-Y"             
[64] "fBodyGyro-mean()-Z"             
[65] "fBodyGyro-std()-X"              
[66] "fBodyGyro-std()-Y"              
[67] "fBodyGyro-std()-Z"              
[68] "fBodyGyro-meanFreq()-X"         
[69] "fBodyGyro-meanFreq()-Y"         
[70] "fBodyGyro-meanFreq()-Z"         
[71] "fBodyAccMag-mean()"             
[72] "fBodyAccMag-std()"              
[73] "fBodyAccMag-meanFreq()"         
[74] "fBodyBodyAccJerkMag-mean()"     
[75] "fBodyBodyAccJerkMag-std()"      
[76] "fBodyBodyAccJerkMag-meanFreq()"   
[77] "fBodyBodyGyroMag-mean()"        
[78] "fBodyBodyGyroMag-std()"         
[79] "fBodyBodyGyroMag-meanFreq()"    
[80] "fBodyBodyGyroJerkMag-mean()"    
[81] "fBodyBodyGyroJerkMag-std()"     
[82] "fBodyBodyGyroJerkMag-meanFreq()"
