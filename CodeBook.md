## Getting and Cleaning Data - Course Project

This CodeBook describes the variables, the data, and any transformations that were performed to clean up the data in order to produce the tidy data set (file) required by the JHU Getting and Cleaning Data course project.

This codebook was based on the [Second Codebook sample](https://gist.github.com/kirstenfrank/699abe3e16fd1dc36e5d) provided on the Getting and Cleaning Data information [page](http://datasciencespecialization.github.io/getclean/) of the Data Science Specialization site.

## Table of Contents

* [**Experimental Design and Background**](#experimental-design-and-background)
* [**Raw Data**](#raw-data)
* [**Processed Data**](#processed-data)
* [**The Fine Print**](#the-fine-print)


##Experimental Design and Background
The data set used for this project comes from University of California, Irvine's (UCI) [Machine Learning Repository](http://archive.ics.uci.edu/ml/index.html). Their README.txt file provides information about the raw data set and should be consulted for details. Here is an excerpt from their website, [Human Activity Recognition Using Smartphones Data Set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones):

> The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 
> 
> The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.


##Raw Data
A description of the raw data, as stated above, can be found in the README.txt and features.txt files, which have been copied to the raw\_data\_files folder in this repository. Here is a brief description from the UCI MLR website for this data set:

> For each record in the dataset it is provided:
> 
> - Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
> - Triaxial Angular velocity from the gyroscope. 
> - A 561-feature vector with time and frequency domain variables. 
> - Its activity label. 
> - An identifier of the subject who carried out the experiment.


##Processed Data

Assignment was converted to treatment group (factor variable), type of injury was coded as a factor penetrating (1) or blunt (0), hospital was coded as a factor (1-12), EMT fluids were binned in 500ml bins, pre-existing clotting diseases were coded as a factor (each assigned a number), pre-existing clotting medications were coded as a factor. Other fluids were binned in 1L bins. Date of discharge from ICU was converted to ICU-free days (out of 30), Ventilator times were converted to ventilator-free days (out of 30), date of discharge was converted to hospital-free days (out of 30). Amount of blood products was summed in two groups, amount given until hemostasis and amount given from hemostasis until 24 hours, these were considered as numeric amounts, these were calculated from summing the blood product lot numbers, sorted by time of administration. Date of death was converted to 24-hour mortality (factor: yes=1 no=0) and 30-day mortality (factor: yes=1, no=0).

## The Fine Print
In accordance with the JHU Honor Code, I certify that my answers here are my own work, and that I have appropriately acknowledged all external sources (if any) that were used in this work.