#This script collects, processes, and cleans a dataset.
#The goal is to prepare tidy dataset that can be used for later analysis.

library(plyr)
library(dplyr)
library(data.table)

#If local data is not present, download the data and put in the data folder
if(!file.exists("./data")) { dir.create("./data") }
if(!file.exists("./data/dataset.zip")) {
  fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  setInternet2(use = TRUE)
  download.file(fileUrl, destfile = "./data/dataset.zip", method = "auto", mode = "wb")
  }

#If local zip has not been expanded, unzip the data
filepath <- file.path("./data", "UCI HAR Dataset")
if(!file.exists(filepath)) { unzip("./data/dataset.zip", exdir = "./data") }

#Get Activities data
data.YTest  <- read.table(file.path(filepath, "test" , "Y_test.txt" ), header = FALSE)
data.YTrain <- read.table(file.path(filepath, "train", "Y_train.txt"), header = FALSE)

#Get Subject data
data.SubjectTest  <- read.table(file.path(filepath, "test" , "subject_test.txt"), header = FALSE)
data.SubjectTrain <- read.table(file.path(filepath, "train", "subject_train.txt"), header = FALSE)

#Get Feature data
data.XTest  <- read.table(file.path(filepath, "test" , "X_test.txt" ), header = FALSE)
data.XTrain <- read.table(file.path(filepath, "train", "X_train.txt"), header = FALSE)

#Merge training and test datasets
data.Activity <- rbind(data.YTest, data.YTrain)
data.Subject <- rbind(data.SubjectTest, data.SubjectTrain)
data.Features <- rbind(data.XTest, data.XTrain)

#Name variables
data.Activity <- rename(data.Activity, activity = V1)
data.Subject <- rename(data.Subject, subject = V1)
data.FeaturesNames <- read.table(file.path(filepath, "features.txt"), head = FALSE)
names(data.Features) <- data.FeaturesNames$V2

#Merge the training and the test sets to create one data set
data.Combined <- cbind(data.Subject, data.Activity)
data <- data.table(cbind(data.Features, data.Combined))

#Extract only the measurements on the mean and standard deviation for each measurement.
data.Subset <- select(data, contains("mean()"), contains ("std()"), ends_with("subject"), ends_with("activity"))

#Uses descriptive activity names to name the activities in the data set
data.ActivityLabels <- read.table(file.path(filepath, "activity_labels.txt"),header = FALSE)
data.Subset$activity <- factor(data.Subset$activity, labels = data.ActivityLabels$V2)

#Appropriately labels the data set with descriptive variable names. 
#prefix t is replaced by time
names(data.Subset) <- gsub("^t", "time", names(data.Subset))
#prefix f is replaced by frequency
names(data.Subset) <- gsub("^f", "frequency", names(data.Subset))
#Acc is replaced by Accelerometer
names(data.Subset) <- gsub("Acc", "Accelerometer", names(data.Subset))
#Gyro is replaced by Gyroscope
names(data.Subset) <- gsub("Gyro", "Gyroscope", names(data.Subset))
#Mag is replaced by Magnitude
names(data.Subset) <- gsub ("Mag", "Magnitude", names(data.Subset))
#BodyBody is replaced by Body
names(data.Subset) <- gsub ("BodyBody", "Body", names(data.Subset))

#From the data set in step 4, creates a second, independent tidy data set with the average of each
#variable for each activity and each subject.
data.SubSummary <- aggregate(. ~subject + activity, data.Subset, mean)
data.SubSummary <- data.SubSummary[order(data.SubSummary$subject, data.SubSummary$activity), ]
write.table(data.SubSummary, file = "tidydata.txt", row.name = FALSE)

write.table(as.table(str(data.SubSummary)), file = "tidydata2.txt", row.name = FALSE)