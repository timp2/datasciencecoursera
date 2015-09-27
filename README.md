# Using run_analysis.R

The run_analysis.R file contains R commands that will load and process the Human Activity Recognition database.

The script assumes that the data set was uncompressed into your current working directory. Uncompressing the data set in your current working directory will result in a folder named "UCI HAR Dataset" being created.

The run_analysis.R script performs the following...
- Loads the specified columns from the test measurement data.
- Loads the test activity list.
- Loads the test subject list.
- Loads the specified columns from the training measurement data.
- Loads the training activity list.
- Loads the training subject list.
- Loads the activity labels.
- Converts the test data to a data.table.
- Appends the subject column to the test data.
- Appends the activity id column to the test data.
- Converts the training data to a data.table.
- Appends the subject column to the training data.
- Appends the activity id column to the training data.
- Combines the test and training tables into one table.
- Converts the activity label data into a data.table.
- Renames the columns of the activity data.
- Merges the activity data with the combined test and training data using the activity ID.
- Renames the measurement columns to meaningful names.
- Calculates the mean of the measurement columns.
- Renames the columns of the calculated data to meaningful names.
- Writes the data to a file.
