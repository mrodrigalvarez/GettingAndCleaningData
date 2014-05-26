# Code Book

## Data

### Input

**Human Activity Recognition** database built from the recordings of 30 subjects performing
activities of daily living (ADL) while carrying a waist-mounted **smartphone** with embedded
inertial sensors.
([data](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip),
[info](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones))

The dataset is divided into 2 groups:
  * "training" data (70% of subjects) and
  * "test" data (30% of subjects)

Data files for each group are in similarly named subdirectories, `train` and `test` respectively.

 * `train/X_train.txt` and `test/X_test.txt` contain the 561 measurements
 * `train/y_train.txt` and `test/y_test.txt` list the activity id corresponding to the observations
 * `train/subject_train.txt` and `test/subject_test.txt` list the identifier of volunteers

Commun files:

 * `activity_labels.txt`: Activities (6) performed by each person. Links the class labels with their activity name.
 * `features.txt`: List of all features both dataset

### Output

The tidy dataset (`tidy.txt`) with the average of each variable (66) for each 
activity (6) and each subject (30) contains 180 (30*6) observations:

 * `subjectID`: identifier of the subject volunteer (1..30)
 * `activityName`: name of the activity label
| id | name |
| -- | ---------- |
| 1 | WALKING            |
| 2 | WALKING_UPSTAIRS   |
| 3 | WALKING_DOWNSTAIRS |
| 4 | SITTING            |
| 5 | STANDING           |
| 6 | LAYING             |

 * 66 measurement variables: average of the respective variable for the given
   subject and activity. Out of the 561 original variables, extracts only the
   measurements on the mean and standard deviation for each measurement.

## Transformation steps

The cleanup script (run_analysis.R) does the following:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive activity names. 
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
