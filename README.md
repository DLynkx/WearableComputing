# WearableComputing
Project work submitted to Coursera as part of the data science specialization program. This is  to demonstrate skills acquired in the "getting and cleaning data" course

The procedure is as follows:

Procedure

1. Set the paths to working directory

2. Load the dplyr package with library(dplyr)

3. Set working directory to main folder

4. Load "features.txt" and "activity_labels.txt"

5. Set working directory to "test" folder

6. Load read the content of "X_test.txt", "y_test.txt" and "subject_test.txt"

Repeat steps 5 and 6 where "test" is substituted by "main"

Read data into R

7. Combine the data sets
 	a. x_test.txt, y_test.txt, subject_test.txt
	b. x_train.txt, y_train.txt, subject_train.txt
   into two separate data tables

8. Add columns with content "test" and "train" to a. and b. respectively

9. Append the train data to the test data

10. Extract mean and standard deviation on each measurement

11. Use the activity-descriptive-names for the activities in the data set

12.  Label data set with descriptive names

13. Group data by activity descriptions and subjects

14. Compute variable averages for each activity and for each subject

15. Set path to main directory

16. write files to csv
