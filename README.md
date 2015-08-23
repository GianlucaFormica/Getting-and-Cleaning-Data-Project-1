
##run_analysis.R
The script is documented. Here is an outline of how it works:

1. Downloads data from "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
2. Reads pertinent files into memory
3. Creates some dataframes of the test and training data and then uses rbind() to combine them
4. Takes the feature names from the features.txt file and replaces the "-", "(", and ")" with underscores and spaces taking care not to introduce any double "_"s or end of line "_"s.
5. Changes the variable names in the combined data set to the adjusted names from features.txt
6. Uses grep() to create an index that can be used to extract the means and stdevs from the data. Any varible name with the subtext "mean" or "std" will be included in the extraction.
7. Uses the index created in step 6 to create a subset of the original data including only means and stdevs
8. Uses replace() to replace the numeric activity codes with the strings found in activity_labels.txt
9. Uses ddply() to create an independent tidy data set with the average of each variable for each activity and each subject

## Codebook

Subject	Activity	
tBodyAcc_mean_X	
tBodyAcc_mean_Y	
tBodyAcc_mean_Z	
tGravityAcc_mean_X	
tGravityAcc_mean_Y	
tGravityAcc_mean_Z	
tBodyAccJerk_mean_X	
tBodyAccJerk_mean_Y	
tBodyAccJerk_mean_Z	
tBodyGyro_mean_X	
tBodyGyro_mean_Y	
tBodyGyro_mean_Z	
tBodyGyroJerk_mean_X	
tBodyGyroJerk_mean_Y	
tBodyGyroJerk_mean_Z
tBodyAccMag_mean	
tGravityAccMag_mean	
tBodyAccJerkMag_mean	
tBodyGyroMag_mean	
tBodyGyroJerkMag_mean	
fBodyAcc_mean_X	
fBodyAcc_mean_Y	
fBodyAcc_mean_Z	
fBodyAcc_meanFreq_X	
fBodyAcc_meanFreq_Y	
fBodyAcc_meanFreq_Z	
fBodyAccJerk_mean_X	
fBodyAccJerk_mean_Y	
fBodyAccJerk_mean_Z	
fBodyAccJerk_meanFreq_X	
fBodyAccJerk_meanFreq_Y	
fBodyAccJerk_meanFreq_Z	
fBodyGyro_mean_X	
fBodyGyro_mean_Y	
fBodyGyro_mean_Z	
fBodyGyro_meanFreq_X	
fBodyGyro_meanFreq_Y	
fBodyGyro_meanFreq_Z	
fBodyAccMag_mean	
fBodyAccMag_meanFreq	
fBodyBodyAccJerkMag_mean	
fBodyBodyAccJerkMag_meanFreq	
fBodyBodyGyroMag_mean	
fBodyBodyGyroMag_meanFreq	
fBodyBodyGyroJerkMag_mean	
fBodyBodyGyroJerkMag_meanFreq	
tBodyAcc_std_X	
tBodyAcc_std_Y	
tBodyAcc_std_Z	
tGravityAcc_std_X	
tGravityAcc_std_Y	
tGravityAcc_std_Z	
tBodyAccJerk_std_X	
tBodyAccJerk_std_Y	
tBodyAccJerk_std_Z	
tBodyGyro_std_X	
tBodyGyro_std_Y	
tBodyGyro_std_Z	
tBodyGyroJerk_std_X	
tBodyGyroJerk_std_Y	
tBodyGyroJerk_std_Z	
tBodyAccMag_std	
tGravityAccMag_std	
tBodyAccJerkMag_std	
tBodyGyroMag_std	
tBodyGyroJerkMag_std	
fBodyAcc_std_X	
fBodyAcc_std_Y	
fBodyAcc_std_Z	
fBodyAccJerk_std_X
fBodyAccJerk_std_Y	
fBodyAccJerk_std_Z	
fBodyGyro_std_X	
fBodyGyro_std_Y	
fBodyGyro_std_Z	
fBodyAccMag_std	
fBodyBodyAccJerkMag_std	
fBodyBodyGyroMag_std	
fBodyBodyGyroJerkMag_std

