<h1> CodeBook for Getting and Cleaning Data Project, Week 4 </h1>

This is the Code Book for the Coursera Data Science Getting and Cleaning Data, Week 4, Course Project

<h2>Instructions as provided:</h2>
"The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set.
Review criteria: are the following 
1. The submitted data set is tidy.
2. The Github repo contains the required scripts.
3. GitHub contains a code book that modifies and updates the available codebooks with the data to indicate all the variables and summaries calculated, along with units, and any other relevant information.
4. The README that explains the analysis files is clear and understandable.
5. The work submitted for this project is the work of the student who submitted it.

Getting and Cleaning Data Course Project
The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

You should create one R script called run_analysis.R that does the following.

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject."

<h2> Structure of Source Data </h2>
The following descriptions are taken directly from the ReadMe.txt file included with the UCI HAR dataset;
"The dataset includes the following files:
- 'README.txt'
- 'features_info.txt': Shows information about the variables used on the feature vector.
- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 
- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 
- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. "

Note:  The Interntial Signals data are **not** used in this project.  

<h2>Data Assumptions</h2>

The Submission instructions state "The code should have a file run_analysis.R in the main directory that can be run as long as the Samsung data is in your working directory.".  Therefore, the run_analysis.R script does not include code for downloading and unzipping the data file mentioned above.  It is assumed the data has been unzipped and is in the working directory, in a folder named "UCI HAR Dataset". 

<h2> Script Methodology </h2>

The run_analysis.R script follows the following steps:

* Read in lists of activities and measurements (using read.table)
* Convert labels to character strings for later use (using as.character)
* Combine Test and Train datasets (using rbind)
* Identify measurements containing “mean” or “std” (using grep)
* Enhance readability of column headings (using gsub)
* Extract columns of interest from dataset 
* Add subject and activity columns to data subset (using cbind)
* Add column names to data subset
* Convert activities & subjects into factors
* Melt data and compute mean values (using melt() and dcast())
* Write tidy data set to file in workspace 

<h2> Variables </h2>
* _subjectTrain_ contains the Subject data for Train. 
* _actTrain_ contains the Activity data for Train. 
* _dataTrain_ contains the Measurement data for Train. 
* _subjectTest_ contains the Subject data for Test.
* _actTest_ contains the Activity data for Test.
* _dataTest_ contains the Measurement  data for Test. 
* _allData_ contains the combined Measurement data for Test and Train (with Test first).
* _allAct_ contains the combined Activity data for Test and Train (with Test first). 
* _allSubject_ contains the combined Subject data for Test and Train (with Test first). 

<h2>Output of Script </h2>
The result of the run_analyis.R script is a text file containing data of the following type (Column headings and row 1 provided as an example):

activity subject tBodyAcc-Mean-X tBodyAcc-Mean-Y tBodyAcc-Mean-Z tBodyAcc-Std-X tBodyAcc-Std-Y tBodyAcc-Std-Z tGravityAcc-Mean-X tGravityAcc-Mean-Y tGravityAcc-Mean-Z tGravityAcc-Std-X tGravityAcc-Std-Y tGravityAcc-Std-Z tBodyAccJerk-Mean-X tBodyAccJerk-Mean-Y tBodyAccJerk-Mean-Z tBodyAccJerk-Std-X tBodyAccJerk-Std-Y tBodyAccJerk-Std-Z tBodyGyro-Mean-X tBodyGyro-Mean-Y tBodyGyro-Mean-Z tBodyGyro-Std-X tBodyGyro-Std-Y tBodyGyro-Std-Z tBodyGyroJerk-Mean-X tBodyGyroJerk-Mean-Y tBodyGyroJerk-Mean-Z tBodyGyroJerk-Std-X tBodyGyroJerk-Std-Y tBodyGyroJerk-Std-Z tBodyAccMag-Mean tBodyAccMag-Std tGravityAccMag-Mean tGravityAccMag-Std tBodyAccJerkMag-Mean tBodyAccJerkMag-Std tBodyGyroMag-Mean tBodyGyroMag-Std tBodyGyroJerkMag-Mean tBodyGyroJerkMag-Std fBodyAcc-Mean-X fBodyAcc-Mean-Y fBodyAcc-Mean-Z fBodyAcc-Std-X fBodyAcc-Std-Y fBodyAcc-Std-Z fBodyAcc-MeanFreq-X fBodyAcc-MeanFreq-Y fBodyAcc-MeanFreq-Z fBodyAccJerk-Mean-X fBodyAccJerk-Mean-Y fBodyAccJerk-Mean-Z fBodyAccJerk-Std-X fBodyAccJerk-Std-Y fBodyAccJerk-Std-Z fBodyAccJerk-MeanFreq-X fBodyAccJerk-MeanFreq-Y fBodyAccJerk-MeanFreq-Z fBodyGyro-Mean-X fBodyGyro-Mean-Y fBodyGyro-Mean-Z fBodyGyro-Std-X fBodyGyro-Std-Y fBodyGyro-Std-Z fBodyGyro-MeanFreq-X fBodyGyro-MeanFreq-Y fBodyGyro-MeanFreq-Z fBodyAccMag-Mean fBodyAccMag-Std fBodyAccMag-MeanFreq fBodyBodyAccJerkMag-Mean fBodyBodyAccJerkMag-Std fBodyBodyAccJerkMag-MeanFreq fBodyBodyGyroMag-Mean fBodyBodyGyroMag-Std fBodyBodyGyroMag-MeanFreq fBodyBodyGyroJerkMag-Mean fBodyBodyGyroJerkMag-Std fBodyBodyGyroJerkMag-MeanFreq
WALKING 1 0.277330758736842 -0.0173838185273684 -0.111148103547368 -0.283740258842105 0.114461336747368 -0.260027902210526 0.935223201473684 -0.282165021263158 -0.068102864 -0.976609642526316 -0.971305961473684 -0.947717226105263 0.0740416333157895 0.0282721095884211 -0.00416840617789474 -0.113615602435789 0.0670025007684211 -0.502699788526316 -0.041830963526 -0.0695300462115789 0.0849448173042105 -0.473535485894737 -0.0546077686594737 -0.344266629473684 -0.0899975423705263 -0.0398428709463158 -0.0461309295021053 -0.207421854757895 -0.304468510631579 -0.404255452631579 -0.136971176556842 -0.219688645631579 -0.136971176556842 -0.219688645631579 -0.141428809031579 -0.0744717500625263 -0.160979552536842 -0.186978364526316 -0.298703679084211 -0.325324878894737 -0.202794306326316 0.0897127264021053 -0.331560117789474 -0.319134719578947 0.056040006846 -0.279686751494737 -0.207548374494737 0.113093646103158 0.0497265196172632 -0.170546964549579 -0.0352255241130632 -0.468999224631579 -0.133586606326316 0.106739857136 -0.534713440421053 -0.209261973376842 -0.386237143210526 -0.185530281244211 -0.339032197115789 -0.103059416434737 -0.255940940315789 -0.516691938736842 -0.0335081597884211 -0.436562227473684 0.0147844986621053 -0.0657746190010526 0.00077332156431579 -0.128623450629474 -0.398032586842105 0.1906437244 -0.0571194000343158 -0.103492403002105 0.0938221807027368 -0.199252568986316 -0.321017953894737 0.268844367525895 -0.319308593778947 -0.381601911789474 0.190663448793684

