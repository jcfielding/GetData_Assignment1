## Original Data

- [source](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) 
- [description](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

## Data Transformation Steps
The "run_analysis.R" script carries out the following:

1.  If local data is not present, download the data and put in the data folder;
2.	If local zip has not been expanded, unzip the data;
3.	Get Subject data;
4.	Get Feature data;
5.	Merge training and test datasets;
6.	Name the variables;
7.	Merge the training and the test sets to create one data set;
8.	Extract only the measurements on the mean and standard deviation for each measurement;
9.	Use descriptive activity names to name the activities in the data set;
10.	Appropriately labels the data set with descriptive variable names;
-	prefix t is replaced by time;
-	prefix f is replaced by frequency;
-	Acc is replaced by Accelerometer;
-	Gyro is replaced by Gyroscope;
-	Mag is replaced by Magnitude;
-	BodyBody is replaced by Body;
11.	From the dataset in step 10, creates a second, independent tidy dataset with the average of each variable grouped by subject and activity;
12.	Write the tidydata.txt to disk.

There are 66 features in the dataset that are means or standard deviations. The output file has 68 columns - 1 for subject, 1 for activity, with the remaining 66 columns corresponding to the 66 mean and standard deviation features. 

### tidydata.txt
This file holds the averages for each  mean/standard deviation measurement for each subject/activity group.

## Data Variables
1.  subject | integer
2.	activity | factor (WALKING,WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)
3.	timeBodyAccelerometer-mean()-X  | number
4.	timeBodyAccelerometer-mean()-Y  | number
5.	timeBodyAccelerometer-mean()-Z  | number
6.	timeGravityAccelerometer-mean()-X  | number
7.	timeGravityAccelerometer-mean()-Y  | number
8.	timeGravityAccelerometer-mean()-Z  | number
9.	timeBodyAccelerometerJerk-mean()-X  | number
10.	timeBodyAccelerometerJerk-mean()-Y  | number
11.	timeBodyAccelerometerJerk-mean()-Z  | number
12.	timeBodyGyroscope-mean()-X  | number
13.	timeBodyGyroscope-mean()-Y  | number
14.	timeBodyGyroscope-mean()-Z  | number
15.	timeBodyGyroscopeJerk-mean()-X  | number
16.	timeBodyGyroscopeJerk-mean()-Y  | number
17.	timeBodyGyroscopeJerk-mean()-Z  | number
18.	timeBodyAccelerometerMagnitude-mean()  | number
19.	timeGravityAccelerometerMagnitude-mean()  | number
20.	timeBodyAccelerometerJerkMagnitude-mean()  | number
21.	timeBodyGyroscopeMagnitude-mean()  | number
22.	timeBodyGyroscopeJerkMagnitude-mean()  | number
23.	frequencyBodyAccelerometer-mean()-X  | number
24.	frequencyBodyAccelerometer-mean()-Y  | number
25.	frequencyBodyAccelerometer-mean()-Z  | number
26.	frequencyBodyAccelerometerJerk-mean()-X  | number
27.	frequencyBodyAccelerometerJerk-mean()-Y  | number
28.	frequencyBodyAccelerometerJerk-mean()-Z  | number
29.	frequencyBodyGyroscope-mean()-X  | number
30.	frequencyBodyGyroscope-mean()-Y  | number
31.	frequencyBodyGyroscope-mean()-Z  | number
32.	frequencyBodyAccelerometerMagnitude-mean()  | number
33.	frequencyBodyAccelerometerJerkMagnitude-mean()  | number
34.	frequencyBodyGyroscopeMagnitude-mean()  | number
35.	frequencyBodyGyroscopeJerkMagnitude-mean()  | number
36.	timeBodyAccelerometer-std()-X  | number
37.	timeBodyAccelerometer-std()-Y  | number
38.	timeBodyAccelerometer-std()-Z  | number
39.	timeGravityAccelerometer-std()-X  | number
40.	timeGravityAccelerometer-std()-Y  | number
41.	timeGravityAccelerometer-std()-Z  | number
42.	timeBodyAccelerometerJerk-std()-X  | number
43.	timeBodyAccelerometerJerk-std()-Y  | number
44.	timeBodyAccelerometerJerk-std()-Z  | number
45.	timeBodyGyroscope-std()-X  | number
46.	timeBodyGyroscope-std()-Y  | number
47.	timeBodyGyroscope-std()-Z  | number
48.	timeBodyGyroscopeJerk-std()-X  | number
49.	timeBodyGyroscopeJerk-std()-Y  | number
50.	timeBodyGyroscopeJerk-std()-Z  | number
51.	timeBodyAccelerometerMagnitude-std()  | number
52.	timeGravityAccelerometerMagnitude-std()  | number
53.	timeBodyAccelerometerJerkMagnitude-std()  | number
54.	timeBodyGyroscopeMagnitude-std()  | number
55.	timeBodyGyroscopeJerkMagnitude-std()  | number
56.	frequencyBodyAccelerometer-std()-X  | number
57.	frequencyBodyAccelerometer-std()-Y  | number
58.	frequencyBodyAccelerometer-std()-Z  | number
59.	frequencyBodyAccelerometerJerk-std()-X  | number
60.	frequencyBodyAccelerometerJerk-std()-Y  | number
61.	frequencyBodyAccelerometerJerk-std()-Z  | number
62.	frequencyBodyGyroscope-std()-X  | number
63.	frequencyBodyGyroscope-std()-Y  | number
64.	frequencyBodyGyroscope-std()-Z  | number
65.	frequencyBodyAccelerometerMagnitude-std()  | number
66.	frequencyBodyAccelerometerJerkMagnitude-std()  | number
67.	frequencyBodyGyroscopeMagnitude-std()  | number
68.	frequencyBodyGyroscopeJerkMagnitude-std()  | number


