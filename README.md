## Getting and Cleaning Data - Course Project

This README outlines all of the files contained in this repository. You will need to follow the instructions in this file and the CodeBook file in order to (re)create the tidy data set (file) required for the JHU Getting and Cleaning Data course project.


## Table of Contents

* [**File Listing**](#file-listing)
* [**Description of Files**](#description-of-files)
* [**Usage**](#usage)
* [**Considerations**](#considerations)


## File Listing

This repository contains 3 files at the root level:

* <code>repo/</code>
	* <code>CodeBook.md</code>
	* <code>README.md</code>
	* <code>run_analysis.R</code>

It also contains 2 directories. The first directory, raw_data_files, contains the raw data files provided in the UCI HAR Dataset:

* <code>repo/raw_data_files/</code>
	* <code>activity_labels.txt</code>
	* <code>features.txt</code>
	* <code>subject_test.txt</code>
	* <code>subject_train.txt</code>
	* <code>X_test.txt</code>
	* <code>X_train.txt</code>
	* <code>y_test.txt</code>
	* <code>y_train.txt</code>

The second directory, tidy_data_file, contains the tidy data set text file we were required to produce.

* <code>repo/tidy_data_file/</code>
	* <code>tidy_data.txt</code>


## Description of Files

* <code>repo/</code>
	* <code>CodeBook.md</code> - a code book that describes the variables, the data, and any transformations or work  performed to clean up the data

	* <code>README.md</code>
- this file, which explains how all of the scripts work and are connected in this repo

	* <code>run_analysis.R</code>


* <code>repo/raw_data_files/</code>
	* <code>activity_labels.txt</code>
	* <code>features.txt</code>
	* <code>subject_test.txt</code>
	* <code>subject_train.txt</code>
	* <code>X_test.txt</code>
	* <code>X_train.txt</code>
	* <code>y_test.txt</code>
	* <code>y_train.txt</code>

	* <code>tidy_data.txt</code>





## Usage

In order to use these files to recreate the tidy data set, follow the instructions below (which assume you know how to use GitHub):

1.	Click the GitHub link to this repository provided in the Evaluation area.
2.	Either download the zip version of the repo or Clone it to your machine.
3.	Unzip the file, if required. This will recreate the folder structure listed above.
4.	In R, set your working directory to the "repo" folder.
6.	The run_analysis.R script requires the following packages to be loaded:
	a.	data.table
	b.	dplyr
7.	Sourcing the run_analysis.R file will cause the script to run and the tidy data set file to be (re)created. Note, the script overwrites the tidy data set file each time. The script takes approximately 30s to run (depending on your hardware).
8.	The tidy data set is stored in a variable called "tidy", which you can explore in R, or by loading the tidy_data.txt file into a text editor.


## Considerations

The run_analysis.R script cleans up after itself in each block of code, therefore it should not take more than 60MB of memory to run.

