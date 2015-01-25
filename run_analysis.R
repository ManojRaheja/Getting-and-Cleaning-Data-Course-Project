#Load all data files from file to data frame
X_train <- read.table("./data/train/X_train.txt")
Y_train_labels <- read.table("./data/train/Y_train.txt")
X_test <- read.table("./data/test/X_test.txt") 
Y_test_labels <- read.table("./data/test/Y_test.txt")
features <- read.table("./data/features.txt")
train_subject_data <- read.table("./data/train/subject_train.txt")
test_subject_data <- read.table("./data/test/subject_test.txt")
activity_labels <- read.table("./data/activity_labels.txt")

#merge the training and test data sets
merged_data <- rbind(X_train,X_test)
merged_labels <- rbind(Y_train_labels, Y_test_labels)
merged_subject <- rbind(train_subject_data, test_subject_data)

#label the columns 
names(merged_data) <- features[[2]]

# Extract columns with mean and std
mean_std_data <- merged_data[unique(c(grep("mean",features[[2]]) , grep("std",features[[2]])))]


#set the column names for activity data set
names(activity_labels) <- c("activityid","activityname")

# set the column name for Labels, will be used for merge
names(merged_labels) <- c("activityid")

#set the colun name for subject data set
names(merged_subject) <- c("subject")

#set the activity names for the labels
merged_labels <- merge(activity_labels,merged_labels,"activityid")


# add activity and subject column to merged data set
mean_std_data$activities <- merged_labels[[2]]
mean_std_data$subject <- merged_subject[[1]]

#produce second data set
#creates a second, independent tidy data set with the average of each variable for each activity and each subject.
second_dataset <- aggregate(mean_std_data, by=list(activity=mean_std_data$activities,subject=mean_std_data$subject),mean)

#write data frame to a file
write.table(mean_std_data,"clean_data_set.txt")
write.table(second_dataset,"second_data_set.txt",row.name=FALSE)



