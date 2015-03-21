## Getting and Cleaning Data - Course Project

This README outlines all of the files contained in this repository. You will need to follow the instructions in this file and the CodeBook file in order to (re)create the tidy data set (file) required for the JHU Getting and Cleaning Data course project.


## Table of Contents

* [**File Listing and Description**](#file-listing-and-description)
* [**How To Use**](#how-to-use)
* [**Considerations**](#considerations)
* [**The Fine Print**](#the-fine-print)


## File Listing and Description

####This repository contains 3 files at the root level:

* <code>GettingAndCleaningData-master/</code>
	* <code>CodeBook.md</code>
		- A code book that describes the variables, the data, and any transformations or work  performed to clean up the data

	* <code>README.md</code>
		- This file, which explains how all of the scripts work and are connected in this repo

	* <code>run_analysis.R</code>
		- The R script containing the code to produce the tidy data set, given the raw data  files

####It also contains 2 directories. The first directory, raw\_data\_files, contains the raw data files provided in the UCI HAR Dataset:

* <code>GettingAndCleaningData-master/raw\_data\_files/</code>
	* <code>activity_labels.txt</code>
		- Links the activity code to the activity name (6 x 2)

	* <code>features.txt</code>
		- List of the variables collected in the test and training data sets (561 x 2)
	
	* <code>subject_test.txt</code>
		- Each row identifies the (test) subject who performed the activity for each window sample, it's range is from 1 to 30 (2947 x 1)
	
	* <code>subject_train.txt</code>
		- Each row identifies the (train) subject who performed the activity for each window sample, it's range is from 1 to 30 (7352 x 1)
	
	* <code>X_test.txt</code>
		- Raw test data set (2947 x 561)
	
	* <code>X_train.txt</code>
		- Raw training data set (7352 x 561)
	
	* <code>y_test.txt</code>
		- Activity code for the each row of the test data set (2947 x 1)
	
	* <code>y_train.txt</code>
		- Activity code for each row of the train data set (7352 x 1)

####The second directory, tidy\_data\_file, contains the tidy data set text file we were required to produce.

* <code>GettingAndCleaningData-master/tidy\_data\_file/</code>
	* <code>tidy_data.txt</code>
		- The tidy data set (181 x 68)


## How To Use

In order to use these files to recreate the tidy data set, follow the instructions below (which assume you know how to use GitHub):

1.	Click the GitHub link to this repository provided in the Evaluation area.
2.	Either download the zip version of the repository or Clone it to your machine.
3.	Unzip the file, if required. This will recreate the folder structure listed above.
4.	In R, set your working directory to the "GettingAndCleaningData-master" folder. (NB: If you cloned the repository, the '-master' part of the folder name will not appear.)
5.	The run_analysis.R script requires the following packages to be loaded:
	* data.table
	* dplyr
6.	Sourcing the run_analysis.R file will cause the script to run and the tidy data set file to be (re)created. Note, the script overwrites the tidy data set file each time. The script takes approximately 30s to run (depending on your hardware, see below).
7.	The tidy data set is stored in a variable called "tidy", which you can explore in R, or by loading the tidy_data.txt file into a text editor.


## Considerations

The run_analysis.R script contains comments throughout that explain what each section of the script does. Here is a summary of those comments:

```r
## This R script called run_analysis.R peforms the following tasks:
## 1. Reads the raw data files and merges them into one data set,
## 2. Replaces the activity codes with the activity names,
## 3. Uses the "features.txt" file to appropriately label the columns/variables,
## 4. Extracts only the mean and std variables from the larger data set,
## 5. Groups the data by subject and activity and then calculates the mean for each
##	  mean/std column/variable,
## 6. Writes out the "tidy" data to a text file.
```

The script cleans up after itself in each block of code, therefore it should not take more than 60MB of memory to run.

While most of the operations have been optimized for speed of execution, that was not a specified consideration for this project. As stated above, this script takes approximately 30s to run on a 2.6 GHz Intel Core i7 Macbook Pro with 8 GB of RAM.

## The Fine Print

In accordance with the JHU Honor Code, I certify that my answers here are my own work, and that I have appropriately acknowledged all external sources (if any) that were used in this work.