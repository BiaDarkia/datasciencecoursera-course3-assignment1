library(dplyr)

#Import feature.txt to provide descriptive names for columns in x_train/x_test
features <- read.table("./features.txt")
#Import activity_labels.txt to convert the activity IDs provided in 
#y_train/y_test into descriptive names
activityLabels <- read.table("./activity_labels.txt")

#Import training data and provide desriptive names for each column
subject_train <- read.table("./train/subject_train.txt", col.names = c("subjectId"))
y_train <- read.table("./train/y_train.txt", col.names = c("activityLabels"))
x_train <- read.table("./train/X_train.txt", col.names = features[["V2"]])

#Import test data and provide desriptive names for each column
subject_test <- read.table("./test/subject_test.txt", col.names = c("subjectId"))
y_test <- read.table("./test/y_test.txt", col.names = c("activityLabels"))
x_test <- read.table("./test/X_test.txt", col.names = features[["V2"]])

#Combine training data into one data set
train <- cbind(subject_train, y_train, x_train)
#Combine test data into one data set
test <- cbind(subject_test, y_test, x_test)

#Combine training and test data into one data set
data <- rbind(train, test)

#Select any columns of x_test/y_test that contain the word "mean" or "std" and make sure 
#to keep the first two columns that contain the subject_train/subject_test and y_train/y_test data
meanStd <- grepl("mean|std", colnames(data))
meanStd[1:2] <- TRUE
dataMeanStd <- data[meanStd]

#Convert the activity IDs provided in y_train/y_test into descriptive names
lookUpActivityLabels <- activityLabels[["V2"]]
dataActivityLabels <- lookUpActivityLabels[dataMeanStd[["activityLabels"]]]
dataMeanStd[["activityLabels"]] <- dataActivityLabels

#Convert the data set into a tidy data set
#Summarize the data of any rows that contain information on the same subject doing 
#the same activity by taking the mean of the provided data and combining it into one row
tidyData <- dataMeanStd %>%
    group_by(subjectId, activityLabels) %>%
    summarise_all(funs(mean))

#Write the data to a text file
write.table(tidyData, "./tidyData.txt", row.names=FALSE)
