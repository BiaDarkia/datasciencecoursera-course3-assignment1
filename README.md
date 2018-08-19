# Functionality of the R script "run_analysis.R"
The R script "run_analysis.R" loads the training and testing data provided by the "Human Activity Recognition Using Smartphones Dataset Version 1.0", merges the training and testing data, extracts any variables that contain information on mean values or standard deviation and produces a tidy data set.

## Prerequisites
To run "run_analysis.R" the R script must be placed in the same dierectory as the two directories "train" and "test" that contain the training and testing data. The R script uses the dplyr package. Hence, dplyr must be installed prior to running the R script.

## Steps involved in producing the tidy data set
1. The file "feature.txt" that contains the names of all features in the training and testing data set is loaded.
2. The file "activity_labels.txt" that contains a table specifying corresponding activities and activity IDs. Activties are coded by activity IDs in the training and testing data set.
3. The training data is loaded. Only the files "subject_train.txt", "y_train.txt" and "x_train.txt" are loaded. Files in the directory "Inertial Signals" do not contain any variable with information on mean values or standard deviation. Each column receives a descriptive name upon loading the data using names provided in "features.txt" for data loaded from "x_train.txt".
4. The testing data is loaded. Only the files "subject_test.txt", "y_test.txt" and "x_test.txt" are loaded. Files in the directory "Inertial Signals" do not contain any variable with information on mean values or standard deviation. Each column receives a descriptive name upon loading the data using names provided in "features.txt" for data loaded from "x_test.txt".
5. The training data, i.e. data from the files "subject_train.txt", "y_train.txt" and "x_train.txt", is merged into one dataset merging across the columns of the three datasets.
6. The testing data, i.e. data from the files "subject_test.txt", "y_test.txt" and "x_test.txt", is merged into one dataset merging across the columns of the three dataset.
7. The training and testing data is merged into one data set merging across the rows of both datasets.
8. Only the column with subject IDs, the column with activity labels and any columns that contain variables that have "mean" or "std" in their name are kept. Any other columns are excluded from the dataset.
9. Actvity IDs in the second column of the dataset are replaced with descriptive activity labels as described in "activity_labels.txt".
10. The dataset is converted into a tidy dataset. If there are multiple observations for any subject executing any of the activities, the multiple observations are summarized in one row by calculating and stating the mean of them.