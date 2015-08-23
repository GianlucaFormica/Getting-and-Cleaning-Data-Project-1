# run_analysis.R
# Author: Anthony D Holmes
# Date: 8/23/2015 

library(plyr)

##########################
# Read data sets
##########################

# Location of data set given by project instructions
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

# Name and location on local computer file is to be saved
datafile <- "C:/Users/HolmesFamily/Desktop/Coursera/Getting_And_Cleaning_Data/projectdata.zip"

# Download and unzip data set
download.file(fileURL, datafile)
dateDownLoaded <- date()
unzip(datafile)

# Read files into memory
X_test <- read.table("UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
X_train <- read.table("UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("UCI HAR Dataset/train/y_train.txt")
labels <- read.table("UCI HAR Dataset/activity_labels.txt")
features <- read.table("UCI HAR Dataset/features.txt")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")

############################################################
# Merge the training and the test sets to create one data set
#############################################################

# Create data frames for the two data sets
# Note that we are combining for each set:
#   Subject ID codes (subject_test, subject_train)
#   Feature ID codes (y_test, y_train)
#   Feature measurements (X_test, X_train)
xtest <- data.frame(subject_test, y_test, X_test)
xtrain <- data.frame(subject_train, y_train, X_train)

# Combine "training" and "test" data sets to create one data set
fulldata <- rbind(xtrain, xtest)

##################################################################
# Appropriately label the data set with descriptive variable names
##################################################################

# Convert features data into characters
features[] <- lapply(features,as.character)

# Create vector of new descriptive names without "-", "()"
# Here we are replacing "-","(", and ")" with "_" while
# preventing any double "_"s and end of line "_"s
nms <- c("Subject","Activity", features$V2)
nms2 <- gsub("-|\\(|,","_",nms)
nms3 <- gsub("\\)|\\)_|_\\)","",nms2)

# Change column names in the full data set
colnames(fulldata) <- nms3

###################################################################
# Extract only the mean and standard deviation for each measurement
###################################################################

# Define search patterns for grep() function
ptn1 = '.mean.'
ptn2 = '.std.'

# Create indices based on searches
index1 = grep(ptn1, features$V2)
index2 = grep(ptn2, features$V2)

# Combine indices and add inital cols for SubjectID and FeatureID columns
index <- c(index1, index2) + 2   

# Create new data frame with only the mean and stdev
msdata = fulldata[,c(1,2,index)]

######################################################################
# Use descriptive activity names to name the activities in the data set
######################################################################

# Here we just use the names supplied in activity_labels.txt
labels[] <- lapply(labels,as.character)

# Despite several hours of trial and error, could not come up with a more
# elegant way of doing this. Thus ...
msdata$Activity <- replace(msdata$Activity, msdata$Activity==1, labels$V2[1])
msdata$Activity <- replace(msdata$Activity, msdata$Activity==2, labels$V2[2])
msdata$Activity <- replace(msdata$Activity, msdata$Activity==3, labels$V2[3])
msdata$Activity <- replace(msdata$Activity, msdata$Activity==4, labels$V2[4])
msdata$Activity <- replace(msdata$Activity, msdata$Activity==5, labels$V2[5])
msdata$Activity <- replace(msdata$Activity, msdata$Activity==6, labels$V2[6])


##############################################################################
# Create a second, independent tidy data set with the average of each variable 
# for each activity and each subject
##############################################################################

tidydata <- ddply(msdata, c("Subject","Activity"), numcolwise(mean))

write.table(tidydata, file="tidydata.txt", row.name=FALSE)


