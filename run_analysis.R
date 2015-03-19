## You should create one R script called run_analysis.R that does the following. 
## Merges the training and the test sets to create one data set.
fullSubjects <- rbind(read.table("./subject_test.txt"), read.table("./subject_train.txt"))

fullActivities <- rbind(read.table("./y_test.txt"), read.table("./y_train.txt"))

fullData <- rbind(read.table("./X_test.txt"), read.table("./X_train.txt"))

## Uses descriptive activity names to name the activities in the data set
activity_labels <- read.table("./activity_labels.txt", stringsAsFactors = FALSE)

names(fullActivities) <- "code"
names(activity_labels) <- c("code", "activity")

fullActivities <- merge(fullActivities, activity_labels, by = "code", all = TRUE)
fullActivities$code <- NULL

## Appropriately labels the data set with descriptive variable names. 
features <- read.table("./features.txt", stringsAsFactors = FALSE)
features <- features[, 2]

names(fullData) <- features
names(fullSubjects) <- "subject"

## Extracts only the measurements on the mean and standard deviation for each measurement. 
colsToKeep <- c(grep("mean()", features, fixed = TRUE), grep("std()", features, fixed = TRUE))

df <- cbind(fullSubjects, fullActivities, fullData[, colsToKeep])

rm(features, colsToKeep)
rm("fullSubjects", "fullActivities", "fullData", "activity_labels")

## From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
#by_activity <- group_by(df, subject, activity)
#act_sum <- summarize_each(by_activity)
