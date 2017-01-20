## Getting and Cleaning Data Project

Sara Ahmad

# Source Data Description :

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
Here are the data for the project:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

For each record it is provided:
======================================

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

# Files Description:

Files in the source directory are given below:
1. features.txt
2. activity_labels.txt
3. subject_train.txt
4. x_train.txt
5. y_train.txt
6. subject_test.txt
7. x_test.txt
8. y_test.txt

# Script Description:

1. Merges the training and the test sets to create one data set

. Read features and activity file and assign column name

. Read and assign column name to all Test Files

. Read and assign column name to all Train Files

. Combine all test and train data files respectively

. Merge the both combined test and train data files into one

2. Extracts only the measurements on the mean and standard deviation for each measurement. 
 
3. Uses descriptive activity names to name the activities in the data set

4. Appropriately labels the data set with descriptive variable names. 

5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

. Exclude the ActivityType as it's mean is not required.

. Writing the data into the file

#Variables Description:

1. ActivityID 
 It contains the activity information from activity_labels.txt
2. ActivityType:
 It contains the activity type information from activity_labels.txt
3. SubjectID
 It contains the subject ID information from both subject_test.txt and subject_label.txt
4. Rest of all variables got their name from feature.txt file and contains the both y_train and y_test data.
