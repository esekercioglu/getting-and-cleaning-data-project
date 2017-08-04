library(plyr)

# Contains the code needed to perform the analysis for Getting and Cleaning Data - Course Project
# List numbers in the comments point to the corresponding instructions

# 0. Download the data
if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile="./data/Dataset.zip")

# Unzip the data to working drectory ("./data")

unzip(zipfile="./data/Dataset.zip",exdir="./data")

#----------------------------------------------------------------------#
#----------------------------------------------------------------------#

# 1 Merges the training and the test sets to create one data set
# First we will read in training and test datasets. 
# Then we will merge training sets and test sets separately using cbind
# Finally we will merge two sets using rbind

# 1.1 Reading files

# 1.1.1 Reading trainings tables:
training_x <- read.table("./data/UCI HAR Dataset/train/X_train.txt")

# We need this to get the training labels
training_y <- read.table("./data/UCI HAR Dataset/train/y_train.txt")
# We need this to get the Subject ID
training_subject <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")

#----------------------------------------------------------------------#

# 1.1.2 Reading testing tables:
test_x <- read.table("./data/UCI HAR Dataset/test/X_test.txt")

# We need this to get the testing labels
test_y <- read.table("./data/UCI HAR Dataset/test/y_test.txt")
# We need this to get the subject ID
test_subject <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")

#----------------------------------------------------------------------#

# Code below gets the features and labels for later use

# 1.1.3 Reading feature vector:
features <- read.table('./data/UCI HAR Dataset/features.txt')

# 1.1.4 Reading activity labels:
activity_labels = read.table('./data/UCI HAR Dataset/activity_labels.txt')

#----------------------------------------------------------------------#
# 1.2 Assigning column names:
colnames(training_x) <- features[,2] 
colnames(training_y) <-"activityId"
colnames(training_subject) <- "subjectId"

colnames(test_x) <- features[,2] 
colnames(test_y) <- "activityId"
colnames(test_subject) <- "subjectId"

colnames(activity_labels) <- c('activityId','activityType')

# 1.3 Merging all data in one set:
# Order of the merge makes it more easy to understand
# Activity ID - Subject ID - Measurement

training_merge <- cbind(training_y, training_subject, training_x)
test_merge <- cbind(test_y, test_subject, test_x)
setAllInOne <- rbind(training_merge, test_merge)

# 2. Extracting only the measurements on the mean and standard deviation for each measurement

# 2.1 Reading column names:
colNames <- colnames(setAllInOne)

# 2.2 Create vector for defining ID, mean and standard deviation:
mean_and_std <- (grepl("activityId" , colNames) | 
                   grepl("subjectId" , colNames) | 
                   grepl("mean.." , colNames) | 
                   grepl("std.." , colNames) 
                  )

# 2.3 Making nessesary subset from setAllInOne:
setForMeanAndStd <- setAllInOne[ , mean_and_std == TRUE]

# 3. Using descriptive activity names to name the activities in the data set:
setWithActivityNames <- merge(setForMeanAndStd, activityLabels,
                              by='activityId',
                              all.x=TRUE)

# 5. Creating a second, independent tidy data set with the average of each variable for each activity and each subject:

TidyData <- aggregate(. ~subjectId + activityId, setWithActivityNames, mean)
TidyData <- TidyData[order(TidyData$subjectId, TidyData$activityId),]

# 5.2 Writing second tidy data set in txt file
write.table(TidyData, "TidyData.txt", row.name=FALSE)