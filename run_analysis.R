
##
## Cleansing project
##

library(data.table)


## Prep
## Load the data

# Load the test data.
x_test.data.set <- read.fortran("UCI HAR Dataset/test/X_test.txt", c("6F16.12", "35X16", "6F16.12", "74X16", "6F16.12"))
y_test.data.set <- read.csv("UCI HAR Dataset/test/y_test.txt", header=FALSE)
subject_test.data.set <- read.csv("UCI HAR Dataset/test/subject_test.txt", header=FALSE)

# Load the training data.
x_train.data.set <- read.fortran("UCI HAR Dataset/train/X_train.txt", c("6F16.12", "35X16", "6F16.12", "74X16", "6F16.12"))
y_train.data.set <- read.csv("UCI HAR Dataset/train/y_train.txt", header=FALSE)
subject_train.data.set <- read.csv("UCI HAR Dataset/train/subject_train.txt", header=FALSE)

# Load the activity data.
activity.data.set <- read.csv("UCI HAR Dataset/activity_labels.txt", header=FALSE, sep=" ")


## Step 1
## Merge the training and the test sets to create one data set.

test.data <- data.table(x_test.data.set)
test.data[,"Subject":=subject_test.data.set]
test.data[,"Activity_ID":=y_test.data.set]

train.data <- data.table(x_train.data.set)
train.data[,"Subject":=subject_train.data.set]
train.data[,"Activity_ID":=y_train.data.set]

combined.data <- rbind(test.data, train.data)


## Step 2
## Extract only the measurements on the mean and standard deviation
## for each measurement. 

# This was done while reading in the data.


## Step 3
## Use descriptive activity names to name the activities in the data set

# Convert the activity data to a data.table so that we can join it
# to the combined data.
activity.data <- data.table(activity.data.set)

# Set the column names to that they can be joined to the combined data.
setnames(activity.data, old=c("V1", "V2"), new=c("Activity_ID", "Activity_Name"))

# Join the motion data to the activity names using the Activity_ID column.
motion.data <- merge(combined.data, activity.data, by=c("Activity_ID"))


## Step 4
## Appropriately label the data set with descriptive variable names.

setnames(motion.data, old=c("V1", "V2", "V3", "V4", "V5", "V6", "V7", "V8", "V9", "V10", "V11", "V12", "V13", "V14", "V15", "V16", "V17", "V18"),
    new=c("Mean_Body_Acceleration_X_Axis",
          "Mean_Body_Acceleration_Y_Axis",
          "Mean_Body_Acceleration_Z_Axis",
          "Standard_Deviation_Body_Acceleration_X_Axis",
          "Standard_Deviation_Body_Acceleration_Y_Axis",
          "Standard_Deviation_Body_Acceleration_Z_Axis",
          "Mean_Gravity_Acceleration_X_Axis",
          "Mean_Gravity_Acceleration_Y_Axis",
          "Mean_Gravity_Acceleration_Z_Axis",
          "Standard_Deviation_Gravity_Acceleration_X_Axis",
          "Standard_Deviation_Gravity_Acceleration_Y_Axis",
          "Standard_Deviation_Gravity_Acceleration_Z_Axis",
          "Mean_Body_Gyro_X_Axis",
          "Mean_Body_Gyro_Y_Axis",
          "Mean_Body_Gyro_Z_Axis",
          "Standard_Deviation_Body_Gyro_X_Axis",
          "Standard_Deviation_Body_Gyro_Y_Axis",
          "Standard_Deviation_Body_Gyro_Z_Axis"
         )
)



## Step 5
## From the data set in step 4, create a second, independent tidy data
## set with the average of each variable for each activity and each subject.

# Calculate means for each of the measures.
motion.data.mean <-
aggregate(cbind(Mean_Body_Acceleration_X_Axis,
                Mean_Body_Acceleration_Y_Axis,
                Mean_Body_Acceleration_Z_Axis,
                Standard_Deviation_Body_Acceleration_X_Axis,
                Standard_Deviation_Body_Acceleration_Y_Axis,
                Standard_Deviation_Body_Acceleration_Z_Axis,
                Mean_Gravity_Acceleration_X_Axis,
                Mean_Gravity_Acceleration_Y_Axis,
                Mean_Gravity_Acceleration_Z_Axis,
                Standard_Deviation_Gravity_Acceleration_X_Axis,
                Standard_Deviation_Gravity_Acceleration_Y_Axis,
                Standard_Deviation_Gravity_Acceleration_Z_Axis,
                Mean_Body_Gyro_X_Axis,
                Mean_Body_Gyro_Y_Axis,
                Mean_Body_Gyro_Z_Axis,
                Standard_Deviation_Body_Gyro_X_Axis,
                Standard_Deviation_Body_Gyro_Y_Axis,
                Standard_Deviation_Body_Gyro_Z_Axis
               ) ~ Activity_ID + + Activity_Name + Subject, data=motion.data, FUN=mean)

# Rename the columns to something meaningful.
setnames(motion.data.mean,
    old=c("Mean_Body_Acceleration_X_Axis",
          "Mean_Body_Acceleration_Y_Axis",
          "Mean_Body_Acceleration_Z_Axis",
          "Standard_Deviation_Body_Acceleration_X_Axis",
          "Standard_Deviation_Body_Acceleration_Y_Axis",
          "Standard_Deviation_Body_Acceleration_Z_Axis",
          "Mean_Gravity_Acceleration_X_Axis",
          "Mean_Gravity_Acceleration_Y_Axis",
          "Mean_Gravity_Acceleration_Z_Axis",
          "Standard_Deviation_Gravity_Acceleration_X_Axis",
          "Standard_Deviation_Gravity_Acceleration_Y_Axis",
          "Standard_Deviation_Gravity_Acceleration_Z_Axis",
          "Mean_Body_Gyro_X_Axis",
          "Mean_Body_Gyro_Y_Axis",
          "Mean_Body_Gyro_Z_Axis",
          "Standard_Deviation_Body_Gyro_X_Axis",
          "Standard_Deviation_Body_Gyro_Y_Axis",
          "Standard_Deviation_Body_Gyro_Z_Axis"
         ),
    new=c("Mean_of_Mean_Body_Acceleration_X_Axis",
          "Mean_of_Mean_Body_Acceleration_Y_Axis",
          "Mean_of_Mean_Body_Acceleration_Z_Axis",
          "Mean_of_Standard_Deviation_Body_Acceleration_X_Axis",
          "Mean_of_Standard_Deviation_Body_Acceleration_Y_Axis",
          "Mean_of_Standard_Deviation_Body_Acceleration_Z_Axis",
          "Mean_of_Mean_Gravity_Acceleration_X_Axis",
          "Mean_of_Mean_Gravity_Acceleration_Y_Axis",
          "Mean_of_Mean_Gravity_Acceleration_Z_Axis",
          "Mean_of_Standard_Deviation_Gravity_Acceleration_X_Axis",
          "Mean_of_Standard_Deviation_Gravity_Acceleration_Y_Axis",
          "Mean_of_Standard_Deviation_Gravity_Acceleration_Z_Axis",
          "Mean_of_Mean_Body_Gyro_X_Axis_Axis",
          "Mean_of_Mean_Body_Gyro_Y_Axis_Axis",
          "Mean_of_Mean_Body_Gyro_Z_Axis_Axis",
          "Mean_of_Standard_Deviation_Body_Gyro_X_Axis",
          "Mean_of_Standard_Deviation_Body_Gyro_Y_Axis",
          "Mean_of_Standard_Deviation_Body_Gyro_Z_Axis"
         )
)

# Write the table to a file.
write.table(motion.data.mean, "tidy.txt", row.name=FALSE)

