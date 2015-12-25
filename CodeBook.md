# Data Overview

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. 
Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) 
wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, 
we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. 
The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly 
partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in 
fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, 
which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body 
acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a 
filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating 
variables from the time and frequency domain.

# Attribute Information:

For each record in the dataset it is provided: 
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment. 

# Data Creation Process 

##Data Merge

Read data from files : features, activityType, subjectTrain, xTrain, yTrain .
Assign column names to the data.
Create final training set by merging yTrain, subjectTrain, and xTrain.
Similarly, read test data from subject_Test, xTest, yTest, and assign column names to the test data.
Create the final test set by merging the xTest, yTest and subjectTest data.
Finally, combine training and test data sets to create a final data set. 

## Mean and Std Dev Extraction

Create a logical vector that contains TRUE values for the ID, mean and std dev columns and FALSE values for the others. 
Extract TRUE values to get required data. 

## Use of descriptive activity names

Merge the final_Data set with the activityType table to include descriptive activity names.
Update the col_Names vector to include the new column names after merge.

## Appropriate labels of the data 

Clean variable names using gsub function. 
The final data set contains the average of each veriable for each activity and subject

# Variables in the final data set (tidy_Data.txt)







