library(dplyr)
library(reshape2)

#####################################################
## Read in Feature and Activity Names
#####################################################
setwd("C:\\Users\\user\\Documents\\Coursera\\TidyingData\\week4\\UCI_HAR_Dataset")

## Read in feature names and rename two variables to be more descriptive
featureNames <- read.table("features.txt")
featureNames <- rename(featureNames, featureID=V1, featureName = V2)

activityNames <- read.table("activity_labels.txt")
activityNames <- rename(activityNames, actID=V1, activityName=V2)


#####################################################
## TRAIN DATASET ## TRAIN DATASET ## TRAIN DATASET ##   
#####################################################
## Read in the three data tables
## sub = Subject Number
## Y = Activity Number
## X = Rest of data
trainIn_X <-read.table("train\\X_train.txt")
trainIn_Y <-read.table("train\\Y_train.txt")
trainIn_sub <-read.table("train\\subject_train.txt")

## Check name of column - R default of "V1" - so rename to SubjectID
names(trainIn_sub)
trainIn_sub <- rename(trainIn_sub, subjectID=V1)
names(trainIn_sub)

## Check name of column - R default of "V1" - so rename to ActivityID
names(trainIn_Y)
trainIn_Y <- rename(trainIn_Y, activityID=V1)
names(trainIn_Y)

## Change the names of X dataset to be based on featureNames data
names(trainIn_X)<-featureNames$featureName

##combine subject, X and Y datasets into one
trainIn <- cbind(trainIn_sub, trainIn_Y, trainIn_X)


#####################################################
## TEST DATASET ## TEST DATASET ## TEST DATASET #####
#####################################################
## Read in the three data tables
## sub = Subject Number
## Y = Activity Number
## X = Rest of data
testIn_X <-read.table("test\\X_test.txt")
testIn_Y <-read.table("test\\Y_test.txt")
testIn_sub <-read.table("test\\subject_test.txt")

## Check name of column - R default of "V1" - so rename to SubjectID
##names(testIn_sub)
testIn_sub <- rename(testIn_sub, subjectID=V1)
##names(testIn_sub)

## Check name of column - R default of "V1" - so rename to ActivityID
names(testIn_Y)
testIn_Y <- rename(testIn_Y, activityID=V1)
names(testIn_Y)

## Change the names of X dataset to be based on featureNames data
names(testIn_X)<-featureNames$featureName

##combine subject, X and Y datasets into one
testIn <- cbind(testIn_sub, testIn_Y, testIn_X)


#####################################################
## COMBINE DATASETS INTO ONE 
## AND GET MEAN AND STD COLS
#####################################################
## Combine train and test datasets
combData <- rbind(trainIn, testIn)

## Get all columns with "-mean()" or "-std()" in their names
cols_m <- grepl("-mean()", names(combData))
cols_s <- grepl("-std()", names(combData))

## Ensure SubjectID and ActivityID are TRUE in array
## (This seems a very messy approach, but is simple...)
cols_m[1]=TRUE
cols_m[2]=TRUE

## Then extract these columns into a new variable
extractData <- combData[,(cols_m | cols_s)]
names(extractData)

namedData <- merge(extractData, activityNames, by.x = "activityID", by.y="actID", all=TRUE)


#####################################################
## Process data to get mean for each variable 
##     by subjectID and activityID
#####################################################
## Get list of all columns in the latest data frame
colsToAgg <- names(namedData)

## Melt the data to have activityID and subjectID
## Keep activityName for clarity, even though duplicating information
## Use colsToAgg, but excluding the first two columns and the last 
meltData<-melt(namedData, id=c("activityID", "subjectID", "activityName"), measure.vars = colsToAgg[3:81])

## Calculate the mean by subject and activity
dataOut <- dcast(meltData, activityID + activityName + subjectID ~ variable, mean)

## Check top few rows
head(dataOut)

## Write final table out to text file
write.table(dataOut, "step5_output_table.txt", row.name=FALSE)

## Code required to read data back in
##readBackIn <- read.table("step5_output_table.txt", header = TRUE)
