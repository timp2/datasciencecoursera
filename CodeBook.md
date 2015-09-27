# Code Book for the data processed by run_analysis.R

The data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip was processed.

The following files were used...
    - UCI HAR Dataset/activity_labels.txt - Mapping of activity ids to activity names.
    - UCI HAR Dataset/test/subject_test.txt - List of subject ids per row in the test data.
    - UCI HAR Dataset/test/X_test.txt - List of measurements per subject and activity for test data.
    - UCI HAR Dataset/test/y_test.txt - List of activity ids per row in the test data.
    - UCI HAR Dataset/train/subject_train.txt - List of subject ids per row in the training data.
    - UCI HAR Dataset/train/X_train.txt - List of measurements per subject and activity for training data.
    - UCI HAR Dataset/train/y_train.txt - List of activity ids per row in the training data.

All columns from activity_labels.txt were used...
   - 1 - Activity ID (integer)
   - 2 - Activity name (string)
   
All columns from subject_test.txt and subject_train.txt were used...
    - 1 - Subject ID (integer)

The following columns from X_test.txt and X_train.txt were used...
    1 - Mean body acceleration on the X axis (float)
    2 - Mean body acceleration on the Y axis (float)
    3 - Mean body acceleration on the Z axis (float)
    4 - Standard deviation of body acceleration on the X axis (float)
    5 - Standard deviation of body acceleration on the Y axis (float)
    6 - Standard deviation of body acceleration on the Z axis (float)
    41 - Mean gravity acceleration on the X axis (float)
    42 - Mean gravity acceleration on the Y axis (float)
    43 - Mean gravity acceleration on the Z axis (float)
    44 - Standard deviation of gravity acceleration on the X axis (float)
    45 - Standard deviation of gravity acceleration on the Y axis (float)
    46 - Standard deviation of gravity acceleration on the Z axis (float)
    121 - Mean body angular acceleration on the X axis (float)
    122 - Mean body angular acceleration on the Y axis (float)
    123 - Mean body angular acceleration on the Z axis (float)
    124 - Standard deviation body angular acceleration on the X axis (float)
    125 - Standard deviation body angular acceleration on the Y axis (float)
    126 - Standard deviation body angular acceleration on the Z axis (float)

All of the columns from y_test.txt and y_train.txt were used...
    1 - Activity ID (integer)
    
The data within X_train.txt, y_train.txt, and subject_train.txt are associated using the position of the row within the file. That is, all first rows within the files are associated together, all second, and so on.

The data within X_test.txt, y_test.txt, and subject_test.txt are associated using the position of the row within the file. That is, all first rows within the files are associated together, all second, and so on.

Thr values within y_test.txt and y_train.txt are associate with the values in the first column of activity_labels.txt. This was use dto provide meaningful labels for the activity for each row.
    
The final table created contains the following columns
    1 - Activity_ID (integer)
    2 - Activity_Name (string)
    3 - Subject (integer)
    4 - Mean_of_Mean_Body_Acceleration_X_Axis (float)
    5 - Mean_of_Mean_Body_Acceleration_Y_Axis (float)
    6 - Mean_of_Mean_Body_Acceleration_Z_Axis (float)
    7 - Mean_of_Standard_Deviation_Body_Acceleration_X_Axis (float)
    8 - Mean_of_Standard_Deviation_Body_Acceleration_Y_Axis (float)
    9 - Mean_of_Standard_Deviation_Body_Acceleration_Z_Axis (float)
    10 - Mean_of_Mean_Gravity_Acceleration_X_Axis (float)
    11 - Mean_of_Mean_Gravity_Acceleration_Y_Axis (float)
    12 - Mean_of_Mean_Gravity_Acceleration_Z_Axis (float)
    13 - Mean_of_Standard_Deviation_Gravity_Acceleration_X_Axis (float)
    14 - Mean_of_Standard_Deviation_Gravity_Acceleration_Y_Axis (float)
    15 - Mean_of_Standard_Deviation_Gravity_Acceleration_Z_Axis (float)
    16 - Mean_of_Mean_Body_Angular_Acceleration_X_Axis_Axis (float)
    17 - Mean_of_Mean_Body_Angular_Acceleration_Y_Axis_Axis (float)
    18 - Mean_of_Mean_Body_Angular_Acceleration_Z_Axis_Axis (float)
    19 - Mean_of_Standard_Deviation_Body_Angular_Acceleration_X_Axis (float)
    20 - Mean_of_Standard_Deviation_Body_Angular_Acceleration_Y_Axis (float)
    21 - Mean_of_Standard_Deviation_Body_Angular_Acceleration_Z_Axis (float)

Each of the Mean_of_* columns was created by calculating the mean across subject and activity.

