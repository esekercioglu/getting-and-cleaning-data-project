library(dplyr)

# Contains the code needed to perform the analysis for Getting and Cleaning Data - Course Project


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

# 1.1.1 Reading activity labels and features

activity_labels <- read.delim("./data/UCI HAR Dataset/activity_labels.txt", header = FALSE, sep = "", col.names = c("ActivityId", "ActivityName"))
features <- read.delim("./data/UCI HAR Dataset/features.txt", header = FALSE, sep = "", col.names = c("FeatureId", "FeatureName"), stringsAsFactors = FALSE)


# 1.1.2 Read Training set

train.subjects <- read.delim("./data/UCI HAR Dataset/train/subject_train.txt", header = FALSE, sep = "", col.names = c("SubjectId"))
train.activities <- read.delim("./data/UCI HAR Dataset/train/y_train.txt", header = FALSE, sep = "", col.names = c("ActivityId"))
train.set <- read.delim("./data/UCI HAR Dataset/train/X_train.txt", header = FALSE, sep = "", col.names = features$FeatureName)
train.data <- tbl_df(cbind(train.subjects, train.activities, train.set))

# 1.1.3 Read Test set

test.subjects <- read.delim("./data/UCI HAR Dataset/test/subject_test.txt", header = FALSE, sep = "", col.names = c("SubjectId"))
test.activities <- read.delim("./data/UCI HAR Dataset/test/y_test.txt", header = FALSE, sep = "", col.names = c("ActivityId"))
test.set <- read.delim("./data/UCI HAR Dataset/test/X_test.txt", header = FALSE, sep = "", col.names = features$FeatureName)
test.data <- tbl_df(cbind(test.subjects, test.activities, test.set))

# 1.1.4 Combine test and training sets

combined_data <- rbind(train.data, test.data)

#-----------------------------------------------------------------------------------#

#2. Extracting measurments on the mean and standart deviation for each measurment

combined_data <- combined_data %>% inner_join(activity_labels)
combined_data <- combined_data %>% select(SubjectId, ActivityName, contains("mean.."), contains("std.."))

#-----------------------------------------------------------------------------------#

#4. Appropriately label the data set with descriptive variable names
# Note that activity names are already cleared above point 2. by selecting ActivityName.

combined_data <- combined_data %>% setNames(gsub("^f", "FrequencyDomain", names(.)))
combined_data <- combined_data %>% setNames(gsub("^t", "TimeDomain", names(.)))
combined_data <- combined_data %>% setNames(gsub("Acc", "Accelerometer", names(.)))
combined_data <- combined_data %>% setNames(gsub("Gyro", "Gyroscope", names(.)))
combined_data <- combined_data %>% setNames(gsub("Mag", "Magnitude", names(.)))
combined_data <- combined_data %>% setNames(gsub("mean\\.\\.", "Mean", names(.)))
combined_data <- combined_data %>% setNames(gsub("std\\.\\.", "Std", names(.)))
combined_data <- combined_data %>% setNames(gsub("\\.", "", names(.)))
combined_data <- combined_data %>% select(-starts_with("angle"))

#5. From the data set in step 4, creates a second, independent 
#   tidy data set with the average of each variable for each activity and each subject

tidy <- combined_data %>% group_by(SubjectId, ActivityName)
tidy <- tidy %>% summarize_each(funs(mean))
write.table(summary, file = "TidyData.txt", row.name = FALSE)
print(tidy)
