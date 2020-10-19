## Setting directory paths

old.packages <- old.path <- "C:/Users/frank/Documents/R_Projects/Coursera/WearableComputing"
test.path <- "C:/Users/frank/Documents/R_Projects/Coursera/WearableComputing/UCI HAR Dataset/test"
train.path <- "C:/Users/frank/Documents/R_Projects/Coursera/WearableComputing/UCI HAR Dataset/train"
proj.path <- "C:/Users/frank/Desktop/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset"

## Loading libraries

library(dplyr)

## Reading data into R

setwd(proj.path)
features <- read.table("./features.txt")
activity_labels <- read.table("./activity_labels.txt")

features <- mutate(features, column.names = gsub("()", ".", features$V2, fixed = TRUE))


setwd(test.path)
setwd(test.path)
x_test <- read.table("./X_test.txt", col.names = features$column.names)
y_test <- read.table("./y_test.txt", col.names = "activity.id")
subject_test <- read.table("./subject_test.txt", col.names = "subject.id")

setwd(train.path)
x_train <- read.table("./X_train.txt", col.names = features$column.names)
y_train <- read.table("./y_train.txt", col.names = "activity.id")
subject_train <- read.table("./subject_train.txt", col.names = "subject.id")

X_test <- data.frame(subject_test, y_test, x_test)
X_train <- data.frame(subject_train, y_train, x_train)

X_test <- mutate(X_test, data.type = "test")
X_train <- mutate(X_train, data.type = "train")

## Append "train" data to "test" data

data <- rbind(X_test, X_train)
observation.id <- 1:length(data$subject.id)

data <- cbind(observation.id,data)

## Extract mean and standard deviation on each measurement

obs.mean.std <- select(data, 1:3, contains("mean") | contains("std"))

## Use the activity-descriptive-names for the activities in the data set

activity_labels <- mutate(activity_labels, activity.description = gsub("_", " ", activity_labels$V2))
obs.mean.std <- merge(activity_labels,obs.mean.std, by.x = "V1", by.y = "activity.id")
obs.mean.std <- select(obs.mean.std,-V1, -V2)

## Appropriately labeling data set with descriptive names

colnames(obs.mean.std) <- gsub("[-]", "_", colnames(obs.mean.std))
colnames(obs.mean.std) <- gsub("Bodybody", "Body", colnames(obs.mean.std))

## Computing variable averages for each activity for each subject

averages <- group_by(obs.mean.std, activity.description, subject.id)
averages <- summarize_each(averages, mean)

setwd(old.path)
write.csv(averages, "./averages.csv")