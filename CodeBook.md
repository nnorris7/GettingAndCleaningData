## Getting and Cleaning Data - Course Project
This CodeBook describes the variables, the data, and any transformations that were performed to clean up the data in order to produce the tidy data set (file) required by the JHU Getting and Cleaning Data course project.

This codebook was based on the [Second Codebook sample](https://gist.github.com/kirstenfrank/699abe3e16fd1dc36e5d) provided on the Getting and Cleaning Data information [page](http://datasciencespecialization.github.io/getclean/) of the Data Science Specialization site.

## Table of Contents
* [**Experimental Design and Background**](#experimental-design-and-background)
* [**Raw Data**](#raw-data)
* [**Processed Data**](#processed-data)
	* [**The Data**](#the-data)
	* [**The Transformations**](#the-transformations)
	* [**The Variables**](#the-variables)
* [**The Fine Print**](#the-fine-print)


##Experimental Design and Background
The data set used for this project comes from University of California, Irvine's (UCI) [Machine Learning Repository](http://archive.ics.uci.edu/ml/index.html). Their README.txt file provides information about the raw data set and should be consulted for details. Here is an excerpt from their website, [Human Activity Recognition Using Smartphones Data Set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones):

> The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 
> 
> The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.


##Raw Data
A description of the raw data, as stated above, can be found in the [README.txt](https://github.com/nnorris7/GettingAndCleaningData/blob/master/raw_data_files/README.txt) and [features.txt](https://github.com/nnorris7/GettingAndCleaningData/blob/master/raw_data_files/features.txt) files of the original data set, which have been copied to the raw\_data\_files folder of this repository for convenience. Here is a brief description of the raw data from the UCI MLR website:

> For each record in the dataset it is provided:
> 
> - Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
> - Triaxial Angular velocity from the gyroscope. 
> - A 561-feature vector with time and frequency domain variables. 
> - Its activity label. 
> - An identifier of the subject who carried out the experiment.


##Processed Data
####The Data
The original data set of 10,299 observations was split by the authors into 2 data sets, one called test with 2,947 records and one called train with 7,352 records, each with 561 variables. The first step recombined the data into one, 10,299 (x 561) record data set. The subject that performed the activity and the activity they performed were also split into separate files (4 in total). These files were recombined in the same order (test and then train) as the observations.

####The Transformations
The activity data above was listed by code, so an inner_join() was used to replace the activity code by the activity name, given in the activity\_labels.txt file.

The description of each variable was added to the data set from the features.txt file. The data set was then subset to retain just observations that were "mean" or "std" measurements, using grep() to find the mean and std columns.

Finally, the full data set was grouped by the subject and the activity and then summarise_each was used to calculate the mean for all the retained variables. NB: The tidy data set columns represent the MEAN of each of the variables listed below.

####The Variables
The tidy data set contains 181 rows (30 subjects x 6 activities + 1 row for column names) x 68 columns (33 mean variables, 33 std variables + 1 column for the subject and 1 column for the activity). The table below provides a description of each variable in the set.

**Please note:**

* Fast Fourier Transformation is abbreviated as FFT in the table
* Acceleration is measured in "units of g", which is meters per second squared or m/s/s
* Jerk is the rate of change of acceleration, which is measured as "g/s" or meters per second cubed or m/s/s/s
* Angular velocity is a measure of rotation per second and is measured in radians per second or radian/s
* Jerk for the gyro is rate of change of angular velocity, which is angular acceleration and is measured in radians per second squared or radian/s/s


|Variable|Description|Units|
|--------|-----------|-----|
|subject|An identifier of the subject who carried out the experiment|person|
|activityName|The activity performed|activity|
|tBodyAcc-mean()-X|Mean acceleration of the body in the x-direction|m/s/s|
|tBodyAcc-mean()-Y|Mean acceleration of the body in the y-direction|m/s/s|
|tBodyAcc-mean()-Z|Mean acceleration of the body in the z-direction|m/s/s|
|tGravityAcc-mean()-X|Mean acceleration of gravity in the x-direction|m/s/s|
|tGravityAcc-mean()-Y|Mean acceleration of gravity in the y-direction|m/s/s|
|tGravityAcc-mean()-Z|Mean acceleration of gravity in the z-direction|m/s/s|
|tBodyAccJerk-mean()-X|Mean jerk of the body in the x-direction|m/s/s/s|
|tBodyAccJerk-mean()-Y|Mean jerk of the body in the y-direction|m/s/s/s|
|tBodyAccJerk-mean()-Z|Mean jerk of the body in the z-direction|m/s/s/s|
|tBodyGyro-mean()-X|Mean angular velocity of the gyroscope in the x-direction|radian/s|
|tBodyGyro-mean()-Y|Mean angular velocity of the gyroscope in the y-direction|radian/s|
|tBodyGyro-mean()-Z|Mean angular velocity of the gyroscope in the z-direction|radian/s|
|tBodyGyroJerk-mean()-X|Mean angular acceleration of the gyroscope in the x-direction|radian/s/s|
|tBodyGyroJerk-mean()-Y|Mean angular acceleration of the gyroscope in the y-direction|radian/s/s|
|tBodyGyroJerk-mean()-Z|Mean angular acceleration of the gyroscope in the z-direction|radian/s/s|
|tBodyAccMag-mean()|Mean magnitude of acceleration of the body (all directions combined)|m/s/s|
|tGravityAccMag-mean()|Mean magnitude of acceleration of gravity (all directions combined)|m/s/s|
|tBodyAccJerkMag-mean()|Mean magnitude of jerk of the body (all directions combined)|m/s/s/s|
|tBodyGyroMag-mean()|Mean magnitude of angular velocity of the gyroscope (all directions combined)|radian/s|
|tBodyGyroJerkMag-mean()|Mean magnitude of angular acceleration of the gyroscope (all directions combined)|radian/s/s|
|fBodyAcc-mean()-X|FFT of mean acceleration of the body in the x-direction|normalized (no units)|
|fBodyAcc-mean()-Y|FFT of mean acceleration of the body in the y-direction|normalized (no units)|
|fBodyAcc-mean()-Z|FFT of mean acceleration of the body in the z-direction|normalized (no units)|
|fBodyAccJerk-mean()-X|FFT of mean jerk of the body in the x-direction|normalized (no units)|
|fBodyAccJerk-mean()-Y|FFT of mean jerk of the body in the y-direction|normalized (no units)|
|fBodyAccJerk-mean()-Z|FFT of mean jerk of the body in the z-direction|normalized (no units)|
|fBodyGyro-mean()-X|FFT of mean angular velocity of the gyroscope in the x-direction|normalized (no units)|
|fBodyGyro-mean()-Y|FFT of mean angular velocity of the gyroscope in the y-direction|normalized (no units)|
|fBodyGyro-mean()-Z|FFT of mean angular velocity of the gyroscope in the z-direction|normalized (no units)|
|fBodyAccMag-mean()|FFT of mean magnitude of acceleration of the body (all directions combined)|normalized (no units)|
|fBodyBodyAccJerkMag-mean()|FFT of mean magnitude of jerk of the body (all directions combined)|normalized (no units)|
|fBodyBodyGyroMag-mean()|FFT of mean magnitude of angular velocity of the gyroscope (all directions combined)|normalized (no units)|
|fBodyBodyGyroJerkMag-mean()|FFT of mean magnitude of angular acceleration of the gyroscope (all directions combined)|normalized (no units)|
|tBodyAcc-std()-X|Standard deviation of acceleration of the body in the x-direction|m/s/s|
|tBodyAcc-std()-Y|Standard deviation of acceleration of the body in the y-direction|m/s/s|
|tBodyAcc-std()-Z|Standard deviation of acceleration of the body in the z-direction|m/s/s|
|tGravityAcc-std()-X|Standard deviation of acceleration of gravity in the x-direction|m/s/s|
|tGravityAcc-std()-Y|Standard deviation of acceleration of gravity in the y-direction|m/s/s|
|tGravityAcc-std()-Z|Standard deviation of acceleration of gravity in the z-direction|m/s/s|
|tBodyAccJerk-std()-X|Standard deviation of jerk of the body in the x-direction|m/s/s/s|
|tBodyAccJerk-std()-Y|Standard deviation of jerk of the body in the y-direction|m/s/s/s|
|tBodyAccJerk-std()-Z|Standard deviation of jerk of the body in the z-direction|m/s/s/s|
|tBodyGyro-std()-X|Standard deviation of angular velocity of the gyroscope in the x-direction|radian/s|
|tBodyGyro-std()-Y|Standard deviation of angular velocity of the gyroscope in the y-direction|radian/s|
|tBodyGyro-std()-Z|Standard deviation of angular velocity of the gyroscope in the z-direction|radian/s|
|tBodyGyroJerk-std()-X|Standard deviation of angular acceleration of the gyroscope in the x-direction|radian/s/s|
|tBodyGyroJerk-std()-Y|Standard deviation of angular acceleration of the gyroscope in the y-direction|radian/s/s|
|tBodyGyroJerk-std()-Z|Standard deviation of angular acceleration of the gyroscope in the z-direction|radian/s/s|
|tBodyAccMag-std()|Standard deviation of magnitude of acceleration of the body (all directions combined)|m/s/s|
|tGravityAccMag-std()|Standard deviation of magnitude of acceleration of gravity (all directions combined)|m/s/s|
|tBodyAccJerkMag-std()|Standard deviation of magnitude of jerk of the body (all directions combined)|m/s/s/s|
|tBodyGyroMag-std()|Standard deviation of magnitude of angular velocity of the gyroscope (all directions combined)|radian/s|
|tBodyGyroJerkMag-std()|Standard deviation of magnitude of angular acceleration of the gyroscope (all directions combined)|radian/s/s|
|fBodyAcc-std()-X|FFT of standard deviation of acceleration of the body in the x-direction|normalized (no units)|
|fBodyAcc-std()-Y|FFT of standard deviation of acceleration of the body in the y-direction|normalized (no units)|
|fBodyAcc-std()-Z|FFT of standard deviation of acceleration of the body in the z-direction|normalized (no units)|
|fBodyAccJerk-std()-X|FFT of standard deviation of jerk of the body in the x-direction|normalized (no units)|
|fBodyAccJerk-std()-Y|FFT of standard deviation of jerk of the body in the y-direction|normalized (no units)|
|fBodyAccJerk-std()-Z|FFT of standard deviation of jerk of the body in the z-direction|normalized (no units)|
|fBodyGyro-std()-X|FFT of standard deviation of angular velocity of the gyroscope in the x-direction|normalized (no units)|
|fBodyGyro-std()-Y|FFT of standard deviation of angular velocity of the gyroscope in the y-direction|normalized (no units)|
|fBodyGyro-std()-Z|FFT of standard deviation of angular velocity of the gyroscope in the z-direction|normalized (no units)|
|fBodyAccMag-std()|FFT of standard deviation of magnitude of acceleration of the body (all directions combined)|normalized (no units)|
|fBodyBodyAccJerkMag-std()|FFT of standard deviation of magnitude of jerk of the body (all directions combined)|normalized (no units)|
|fBodyBodyGyroMag-std()|FFT of standard deviation of magnitude of angular velocity of the gyroscope (all directions combined)|normalized (no units)|
|fBodyBodyGyroJerkMag-std()|FFT of standard deviation of magnitude of angular acceleration of the gyroscope (all directions combined)|normalized (no units)|

## The Fine Print
In accordance with the JHU Honor Code, I certify that my answers here are my own work, and that I have appropriately acknowledged all external sources (if any) that were used in this work.
