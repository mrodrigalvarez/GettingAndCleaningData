################################################################################
## FILE:    run_analysis.R
## PURPOSE: R script for Getting and Cleaning Data Course Project
################################################################################

################################################################################
# Download the dataset into workspace (wd), if it is not avalaible in local 
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
fileZip <- "dataset.zip"
if (!file.exists(fileZip)) download.file(fileUrl, fileZip, method = "auto")
# unzip the dataset into wd - dir 'UCI HAR Dataset'
if(file.exists(fileZip)){unzip(fileZip)}
# variable that specifies the data path
datasetPath = "./UCI HAR Dataset/"
################################################################################
# 1. Merges the training and the test sets to create one data set.
# read datasets. [feature1 .. feature561]
train.dataset <- read.table(paste(datasetPath,"train/X_train.txt", sep=""))
test.dataset <- read.table(paste(datasetPath,"test/X_test.txt", sep=""))
dataMerge <- rbind(train.dataset, test.dataset)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
features <- read.table(paste(datasetPath, "features.txt", sep=""))
colnames(features) <- c('id', 'name')
features.requiredID <- grep("-mean\\(\\)|-std\\(\\)", features$name)
dataMerge <- dataMerge[, features.requiredID]

# 3. Uses descriptive activity names to name the activities in the data set
colnames(dataMerge) <- features$name[features.requiredID]

# 4. Appropriately labels the data set with descriptive activity names. 
# read and add subjects from both sets
train.subjectID <- read.table(paste(datasetPath, "train/subject_train.txt", sep=""))
test.subjectID <- read.table(paste(datasetPath, "test/subject_test.txt", sep=""))
dataMerge$subjectID <- rbind(train.subjectID, test.subjectID)[ ,1]

# read activities ID from both sets
train.activityID <- read.table(paste(datasetPath, "train/y_train.txt", sep=""))
test.activityID <- read.table(paste(datasetPath, "test/y_test.txt", sep=""))
mergeActivities <- rbind(train.activityID, test.activityID)[ ,1]
# read activity labels and add activity names
activity <- read.table(paste(datasetPath, "activity_labels.txt", sep=""))
colnames(activity) <- c('id', 'name')
dataMerge$activityName <- factor(mergeActivities, levels = activity$id, labels = activity$name)

# 5. Creates a second, independent tidy data set with the average of each variable 
#    for each activity and each subject. Merge both sets to create one data set
# Reshape the data
library(reshape2)
dataMelt <- melt(dataMerge, id = c("subjectID", "activityName"))
dataTidy <- dcast(dataMelt, subjectID + activityName ~ variable, mean)
# Save the tidy data set
write.table(dataTidy, file = "tidy.txt", row.names = FALSE, quote = FALSE)
################################################################################
