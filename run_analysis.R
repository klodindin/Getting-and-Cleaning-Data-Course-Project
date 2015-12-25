
setwd('C:/Users/herncl02/Documents/COURSERA/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset')

# Read data from files 
features     = read.table('./features.txt',header=FALSE)
activityType = read.table('./activity_labels.txt',header=FALSE)
subjectTrain = read.table('./train/subject_train.txt',header=FALSE)
xTrain       = read.table('./train/x_train.txt',header=FALSE)
yTrain       = read.table('./train/y_train.txt',header=FALSE)
 
# Assign column names to the data 
colnames(activityType)  = c('activityId','activityType')
colnames(subjectTrain)  = "subjectId"
colnames(xTrain)        = features[,2]
colnames(yTrain)        = "activityId"

# Create final training set by merging yTrain, subjectTrain, and xTrain 
training_Data = cbind(yTrain,subjectTrain,xTrain) 

# Read test data 
subject_Test = read.table('./test/subject_test.txt',header=FALSE)
xTest       = read.table('./test/x_test.txt',header=FALSE)
yTest       = read.table('./test/y_test.txt',header=FALSE)

 
# Assign column names to the test data
colnames(subject_Test) = "subjectId"; 
colnames(xTest)       = features[,2];  
colnames(yTest)       = "activityId"; 


# Create the final test set by merging the xTest, yTest and subjectTest data 
test_Data = cbind(yTest,subject_Test,xTest); 

  
# Combine training and test data to create a final data set 
final_Data = rbind(training_Data,test_Data); 
 
 
# Create vector for the column names from the final_Data which will be used to select the desired mean() & stddev()
col_Names  = colnames(final_Data);  

# Create a logical vector that contains TRUE values for the ID, mean() & stddev() columns and FALSE for others 
logicalVector = (grepl("activity..",col_Names) | grepl("subject..",col_Names) | grepl("-mean..",col_Names) & 
!grepl("-meanFreq..",col_Names) & !grepl("mean..-",col_Names) | grepl("-std..",col_Names) & !grepl("-std()..-",col_Names)); 

# Subset final_Data table based on the logical vector to keep only required columns 
final_Data = final_Data[logicalVector==TRUE]; 

# Merge the final_Data set with the activityType table to include descriptive activity names 
final_Data = merge(final_Data,activityType,by='activityId',all.x=TRUE); 

# Update the col_Names vector to include the new column names after merge 
col_Names  = colnames(final_Data);  

# Clean up the variable names 
for (i in 1:length(col_Names))  
{ 
col_Names[i] = gsub("\\()","",col_Names[i]) 
col_Names[i] = gsub("-std$","StdDev",col_Names[i]) 
col_Names[i] = gsub("-mean","Mean",col_Names[i]) 
col_Names[i] = gsub("^(t)","time",col_Names[i]) 
col_Names[i] = gsub("^(f)","freq",col_Names[i]) 
col_Names[i] = gsub("([Gg]ravity)","Gravity",col_Names[i]) 
col_Names[i] = gsub("([Bb]ody[Bb]ody|[Bb]ody)","Body",col_Names[i]) 
col_Names[i] = gsub("[Gg]yro","Gyro",col_Names[i]) 
col_Names[i] = gsub(tidy_"AccMag","AccMagnitude",col_Names[i]) 
col_Names[i] = gsub("([Bb]odyaccjerkmag)","BodyAccJerkMagnitude",col_Names[i]) 
col_Names[i] = gsub("JerkMag","JerkMagnitude",col_Names[i]) 
col_Names[i] = gsub("GyroMag","GyroMagnitude",col_Names[i]) 
}; 
 
# Reassign new descriptive column names to the final_Data set 
colnames(final_Data) = col_Names; 

# Create a new table, NoActivityTypeData without the activityType column 
NoActivityTypeData  = final_Data[,names(final_Data) != 'activityType']; 

# Summarize the NoActivityTypeData table to include only the mean of each variable for each activity and each subject 
tidy_Data    = aggregate(NoActivityTypeData[,names(NoActivityTypeData) != c('activityId','subjectId')],
by=list(activityId=NoActivityTypeData$activityId,subjectId = NoActivityTypeData$subjectId),mean); 
 
# Merge the tidy_Data with activityType to include descriptive activity names 
tidy_Data    = merge(tidy_Data,activityType,by='activityId',all.x=TRUE); 

# Export the tidy_Data set  
write.table(tidy_Data, './tidy_Data.txt',row.names=TRUE,sep='\t'); 
