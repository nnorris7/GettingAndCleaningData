## This R script called run_analysis.R peforms the following tasks:
## 1. Reads the raw data files and merges them into one data set,
## 2. Replaces the activity codes with the activity names,
## 3. Uses the "features.txt" file to appropriately label the columns/variables,
## 4. Extracts only the mean and std variables from the larger data set,
## 5. Groups the data by subject and activity and then calculates the mean for each
##	  mean/std column/variable,
## 6. Writes out the "tidy" data to a text file.


## 1. Reads the raw data files and merges them into one data set
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

## 2. Replaces the activity codes with the activity names
activity_labels <- fread("./raw_data_files/activity_labels.txt")
 
setnames(full_act, "activityCode")
setnames(activity_labels, c("activityCode", "activityName"))

full_act$activityCode <- as.numeric(full_act$activityCode)
activity_labels$activityCode <- as.numeric(activity_labels$activityCode)

full_act <- inner_join(full_act, activity_labels)
full_act <- select(full_act, -activityCode)

## 3. Uses the "features.txt" file to appropriately label the columns/variables
setnames(full_subj, "subject")

features <- read.table("./raw_data_files/features.txt", stringsAsFactors = FALSE)
features <- features[, 2]

setnames(full_obs, features)

## 4. Extracts only the mean and std variables from the larger data set
colsToKeep <- c(grep("mean()", features, fixed = TRUE), grep("std()", features, fixed = TRUE))
full_obs <- full_obs[, colsToKeep]

full_data <- bind_cols(full_subj, full_act, full_obs)

rm(features, colsToKeep)
rm("full_subj", "full_act", "full_obs", "activity_labels")

## 5. Groups the data by subject and activity and then calculates the mean for each mean/std column/variable
groupby_subj_act <- group_by(full_data, subject, activityName)
tidy <- summarise_each(groupby_subj_act, funs(mean))

## 6. Writes out the "tidy" data to a text file
write.table(tidy, "./tidy_data_file/tidy_data.txt", row.name = FALSE)


## End of file