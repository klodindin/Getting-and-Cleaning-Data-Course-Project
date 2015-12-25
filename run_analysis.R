
install.packages("reshape2")

setwd('C:/Users/herncl02/Documents/COURSERA/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset')

library(reshape2) 

# Load activity labels + features 
activityLabels <- read.table("activity_labels.txt") 
activityLabels[,2] <- as.character(activityLabels[,2]) 
features <- read.table("features.txt") 
features[,2] <- as.character(features[,2]) 
 
# Extract only the data with mean and standard deviation 
featuresWanted <- grep(".*mean.*|.*std.*", features[,2]) 
featuresWanted_names <- features[featuresWanted,2] 
featuresWanted_names = gsub('-mean', 'Mean', featuresWanted_names) 
featuresWanted_names = gsub('-std', 'Std', featuresWanted_names) 
featuresWanted_names <- gsub('[-()]', '', featuresWanted_names) 

# Load the datasets 
train <- read.table("train/X_train.txt")[featuresWanted] 
train_Activities <- read.table("train/Y_train.txt") 
train_Subjects <- read.table("train/subject_train.txt") 
train <- cbind(train_Subjects, train_Activities, train) 

test <- read.table("test/X_test.txt")[featuresWanted] 
test_Activities <- read.table("test/Y_test.txt") 
test_Subjects <- read.table("test/subject_test.txt") 
test <- cbind(test_Subjects, test_Activities, test) 

# Merge datasets and add labels 
all_Data <- rbind(train, test) 
colnames(all_Data) <- c("subject", "activity", featuresWanted_names) 

# Convert activities & subjects into factors 
all_Data$activity <- factor(all_Data$activity, levels = activityLabels[,1], labels = activityLabels[,2]) 
all_Data$subject <- as.factor(all_Data$subject) 
 
all_Data_melt <- melt(all_Data, id = c("subject", "activity")) 
all_Data_mean <- dcast(all_Data_melt, subject + activity ~ variable, mean) 

# Save data in tidy_data.txt
write.table(all_Data_mean, "tidy_data.txt", row.names = FALSE, quote = FALSE) 

