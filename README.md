
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

##Codebook

From features_info.txt:

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

## The tidydata.txt variables names are below. 
This data set only include means and standard deviations. The names 
are the same as the original but with "-", "(", and ")" replaced with "_", except in cases where a double "_" or 
an end of line "_" might occur. In those cases the character was simply removed. The mapping is therefore straightforward.

Subject : Subject id code
Activity : type of activity
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
