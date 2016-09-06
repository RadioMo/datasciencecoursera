## Coursera - Data Science
## Getting and Cleaning Data Course Project, Week 4 Aassignment
## GitHub User Name:  RadioMo
## Date: Sep 7, 2016

# run_analysis.R

# Load needed libraries
library(reshape2)

# Read in training files 
subjectTrain <- read.table("UCI HAR Dataset/train/subject_train.txt")
actTrain <- read.table("UCI HAR Dataset/train/Y_train.txt")
dataTrain <- read.table("UCI HAR Dataset/train/X_train.txt") 

# Read in test files 
subjectTest <- read.table("UCI HAR Dataset/Test/subject_test.txt")
actTest <- read.table("UCI HAR Dataset/Test/Y_test.txt")
dataTest <- read.table("UCI HAR Dataset/Test/X_test.txt") 

# merge test and training datasets into combined datasets; add activity and subject
allData <- rbind(dataTest,dataTrain)
allActa <- rbind(actTest,actTrain)
allSubject <- rbind(subjectTest,subjectTrain)

# # # Completion of Step 1 # # #

# # # PREPARE LIST OF MEASUREMENTS WITH MEAN OR STD # # #

# Read in lists of activities and measurements
activityLabel  <- read.table("UCI HAR Dataset/activity_labels.txt")
measureLabel <- read.table("UCI HAR Dataset/features.txt")

# Convert labels to character strings for later use 
activityLabel[,2] <- as.character(activityLabel[,2])
measureLabel[,2] <- as.character(measureLabel[,2])

# Identify measurements containing “mean” or “std”
measureExtract <- grep(".*mean.*|.*std.*", measureLabel[,2])
measureExtract.names <- measureLabel [measureExtract,2]

# Improve readability of output 
measureExtract.names <- gsub('mean', 'Mean', measureExtract.names)
measureExtract.names <- gsub('std', 'Std', measureExtract.names)
measureExtract.names <- gsub('[()]', '', measureExtract.names)

# Extract columns of interest from dataset
subData <- allData[,measureExtract]

# # # Completion of Step 2 # # #

# add subject and activity columns to data subset
subData <- cbind(allAct,allSubject,subData)

# # # Completion of Step 3  # # #

# add column names to data subset
colnames(subData) <- c("activity","subject",measureExtract.names)

# # # Completion of Step 4 # # #

# Convert activities & subjects into factors
subData$activity <- factor(subData$activity, levels = activityLabel[,1], labels = activityLabel[,2])
subData$subject <- as.factor(subData$subject)

# Melt data and compute mean values
subData_melt <- melt(subData, id = c("activity","subject"))
subData_mean <- dcast(subData_melt, activity + subject ~ variable, mean)

# write tidy data set to file in workspace
write.table(subData_mean,"mean_data_tidy.txt", row.names = FALSE, quote = FALSE)

# # # Completion of Step 5 # # #
