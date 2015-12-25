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

# Attribute Information

For each record in the dataset, it is provided: 
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment. 

# Data Creation Process 

- 1. Download the dataset and unzip the file. 
- 2. Load the activity labels and features. 
- 3. Load both the training and test data sets, keeping only those columns with a mean or a standard deviation.
- 4. Load the activity and subject data for each data set, and merge those columns with the dataset.
- 5. Merge the test and train data sets.
- 6. Convert the  activity  and  subject  columns into factors.
- 7. Using the melt command, create a tidy data set that consists of the mean value of each variable 
    for each subject and activity.

# Final Data (tidy_data.txt) Variable List 

## Identifier Variable
subject  - test subject ID

## Activity Variable 
- activity  - activity type performed when the corresponding measurements were taken
- activity labels : 
   - 1. WALKING : subject was walking during the test
   - 2. WALKING_UPSTAIRS : subject was walking up a staircase during the test
   - 3. WALKING_DOWNSTAIRS : subject was walking down a staircase during the test
   - 4. SITTING : subject was sitting during the test
   - 5. STANDING : subject was standing during the test
   - 6 LAYING : subject was laying down during the test

## Measurement Variables
- tBodyAccMeanX 
- tBodyAccMeanY 
- tBodyAccMeanZ 
- tBodyAccStdX 
- tBodyAccStdY 
- tBodyAccStdZ 
- tGravityAccMeanX 
- tGravityAccMeanY 
- tGravityAccMeanZ 
- tGravityAccStdX 
- tGravityAccStdY 
- tGravityAccStdZ 
- tBodyAccJerkMeanX 
- tBodyAccJerkMeanY 
- tBodyAccJerkMeanZ 
- tBodyAccJerkStdX 
- tBodyAccJerkStdY 
- tBodyAccJerkStdZ 
- tBodyGyroMeanX 
- tBodyGyroMeanY 
- tBodyGyroMeanZ 
- tBodyGyroStdX 
- tBodyGyroStdY 
- tBodyGyroStdZ 
- tBodyGyroJerkMeanX 
- tBodyGyroJerkMeanY 
- tBodyGyroJerkMeanZ 
- tBodyGyroJerkStdX 
- tBodyGyroJerkStdY 
- tBodyGyroJerkStdZ 
- tBodyAccMagMean 
- tBodyAccMagStd 
- tGravityAccMagMean 
- tGravityAccMagStd 
- tBodyAccJerkMagMean 
- tBodyAccJerkMagStd 
- tBodyGyroMagMean 
- tBodyGyroMagStd 
- tBodyGyroJerkMagMean 
- tBodyGyroJerkMagStd 
- fBodyAccMeanX 
- fBodyAccMeanY 
- fBodyAccMeanZ 
- fBodyAccStdX 
- fBodyAccStdY 
- fBodyAccStdZ 
- fBodyAccMeanFreqX 
- fBodyAccMeanFreqY 
- fBodyAccMeanFreqZ 
- fBodyAccJerkMeanX 
- fBodyAccJerkMeanY 
- fBodyAccJerkMeanZ 
- fBodyAccJerkStdX 
- fBodyAccJerkStdY 
- fBodyAccJerkStdZ 
- fBodyAccJerkMeanFreqX 
- fBodyAccJerkMeanFreqY 
- fBodyAccJerkMeanFreqZ 
- fBodyGyroMeanX 
- fBodyGyroMeanY 
- fBodyGyroMeanZ 
- fBodyGyroStdX 
- fBodyGyroStdY 
- fBodyGyroStdZ 
- fBodyGyroMeanFreqX 
- fBodyGyroMeanFreqY 
- fBodyGyroMeanFreqZ 
- fBodyAccMagMean 
- fBodyAccMagStd 
- fBodyAccMagMeanFreq 
- fBodyBodyAccJerkMagMean 
- fBodyBodyAccJerkMagStd 
- fBodyBodyAccJerkMagMeanFreq 
- fBodyBodyGyroMagMean 
- fBodyBodyGyroMagStd 
- fBodyBodyGyroMagMeanFreq 
- fBodyBodyGyroJerkMagMean 
- fBodyBodyGyroJerkMagStd 
- fBodyBodyGyroJerkMagMeanFreq 








