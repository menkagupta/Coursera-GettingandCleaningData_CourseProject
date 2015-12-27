##Coursera Getting And Cleaning Data Course Project

#Getting ready, load plyr
library(plyr)

#Step 1 - Merge the training and the test sets to create one data set
#------------------------------------------------------------------------------#

#load training data into R
x_train <- read.table("train/X_train.txt")
y_train <- read.table("train/y_train.txt")
subject_train <- read.table("train/subject_train.txt")

#load test data into R
x_test <- read.table("test/X_test.txt")
y_test <- read.table("test/y_test.txt")
subject_test <- read.table("test/subject_test.txt")

#merge train and test data
x_merge <-rbind(x_train, x_test)
y_merge <-rbind(y_train, y_test)
subject_merge <-rbind(subject_train, subject_test)

#Step 2 - Extract only the measurements on the mean and standard deviation for each measurement
#------------------------------------------------------------------------------#
features <- read.table("features.txt")

# get only columns with mean() or std() in their names
mean_and_std <- grep("-(mean|std)\\(\\)", features[, 2])

# subset the desired columns
x_meanstd <- x_merge[, mean_and_std]

# correct the column names
names(x_meanstd) <- features[mean_and_std, 2]

# Step 3 - Use descriptive activity names to name the activities in the data set
#------------------------------------------------------------------------------#
activities <- read.table("activity_labels.txt")

y_activity <- y_merge

# update values with correct activity names
y_activity[, 1] <- activities[y_activity[, 1], 2]

# correct column name
names(y_activity) <- "activity"

#Step 4 - Appropriately label the data set with descriptive variable names.
#------------------------------------------------------------------------------#
names(subject_merge) <- "subject"

# create a combined data set
completedata <- cbind(x_meanstd, y_activity, subject_merge)

#Step 5 - Create an independent tidy data set with the average of each variable for each activity and each subject.
#Total 68 columns, last two columns are "activity" & "subject", calculating average based on that.
#------------------------------------------------------------------------------#
tidy_data <- ddply(completedata, .(subject, activity), function(x) colMeans(x[, 1:66]))

write.table(tidy_data, "tidy_data.txt", row.name=FALSE)
