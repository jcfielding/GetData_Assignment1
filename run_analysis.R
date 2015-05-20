

#Remove before publishing
setwd("C:/Users/James/Documents/R/GetData_Assignment1")

library(dplyr)
library(data.table)

#Download the data and put in the data folder
if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
setInternet2(use = TRUE)
download.file(fileUrl, destfile = "./data/dataset.zip", method = "auto", mode = "wb")

#Unzip the data
unzip("./data/dataset.zip", exdir = "./data")

#Get the files
filepath <- file.path("./data", "UCI HAR Dataset")
#files <-list.files(filepath, recursive = TRUE)
#files

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

#Extracts only the measurements on the mean and standard deviation for each measurement.
data.Subset <- select(data, contains("mean()"), contains ("std()"), contains ("subject"), contains ("activity"))

#Uses descriptive activity names to name the activities in the data set
data.ActivityLabels <- read.table(file.path(filepath, "activity_labels.txt"),header = FALSE)
data.Subset$activity <- factor(data.Subset$activity, labels = data.ActivityLabels$V2)



#Appropriately labels the data set with descriptive variable names. 
#From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.