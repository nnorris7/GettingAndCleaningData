# You should create one R script called run_analysis.R that does the following. 
# Merges the training and the test sets to create one data set.
subj_test <- fread("./raw_data_files/subject_test.txt")
subj_train <- fread("./raw_data_files/subject_train.txt")
full_subj <- bind_rows(subj_test, subj_train)
rm("subj_test", "subj_train")

y_test <- fread("./raw_data_files/y_test.txt")
y_train <- fread("./raw_data_files/y_train.txt")
full_act <- bind_rows(y_test, y_train)
rm("y_test", "y_train")

x_test <- read.table("./raw_data_files/X_test.txt")
x_train <- read.table("./raw_data_files/X_train.txt")
full_obs <- bind_rows(tbl_df(x_test), tbl_df(x_train))
rm("x_test", "x_train")

## Uses descriptive activity names to name the activities in the data set
activity_labels <- fread("./raw_data_files/activity_labels.txt")
 
setnames(full_act, "activityCode")
setnames(activity_labels, c("activityCode", "activityName"))

full_act$activityCode <- as.numeric(full_act$activityCode)
activity_labels$activityCode <- as.numeric(activity_labels$activityCode)

full_act <- inner_join(full_act, activity_labels)
full_act <- select(full_act, -activityCode)

## Appropriately labels the data set with descriptive variable names. 
setnames(full_subj, "subject")

features <- read.table("./raw_data_files/features.txt", stringsAsFactors = FALSE)
features <- features[, 2]

setnames(full_obs, features)

## Extracts only the measurements on the mean and standard deviation for each measurement.
colsToKeep <- c(grep("mean()", features, fixed = TRUE), grep("std()", features, fixed = TRUE))
full_obs <- full_obs[, colsToKeep]

full_data <- bind_cols(full_subj, full_act, full_obs)

rm(features, colsToKeep)
rm("full_subj", "full_act", "full_obs", "activity_labels")

## From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
groupby_subj_act <- group_by(full_data, subject, activityName)
tidy <- summarise_each(groupby_subj_act, funs(mean))

write.table(tidy, "./tidy_data_file/tidy_data.txt", row.name = FALSE)
