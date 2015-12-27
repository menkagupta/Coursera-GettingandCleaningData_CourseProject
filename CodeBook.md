run_analysis.md performs the following 5 steps as per Course Project description

1.Merge the training and the test sets to create one data set
By examining the Test and train data sets, it was observed that they contain similar data with same number of columns. 
Similar dats sets were combined using rbind() function.

2.From the merged data set, only columns with mean and standard deviation were extracted and their column names were corrected using features.txt.

3.Using activity_labels.txt, activity ids were replaced with descriptive activity names.

4.Other non-descriptive column names were replaced with appropriate descriptive names.
Also, all data sets were combined to create a single dataset.

5.Finally, an independent tidy data set was created with the average of each variable for each activity and subject.
 The tidy data set contains total 68 columns and 180 rows and was submitted to the project form and uploaded to the GitHub repository.
 
 Variables used:
 
 x_train, y_train, subject_train, x_test, y_test, subject_test - to store data from the source files.
 
 x_merge, y_merge, subject_merge - merged data from train and test data sets. 
 
 features - contains descriptive names mean and standard deviation columns.
 
 mean_and_std - used to extract mean and standard deviation columns from the merged data.
 
 x_meanstd - contains extracted data for mean and standard deviation columns.
 
 activities - contains activity decriptions.
 
 y_activity - activity data with descriptions.
 
 completedata - combined data set.
 
 tidy_data - final tidy data set with the average of each variable for each activity and each subject.
 
