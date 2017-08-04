# Codebook

The dataset named TidyData.txt contains 68 Columns and 180 Rows. Unit of observation is Subject-Activity, i.e. each row corresponds to a subject-activity pairing.

30 subjects X 6 activities = 180 Rows.

First two columns are identifiers and following 66 columns are measurement variables

## Identifiers

* SubjectId - Number between 1 and 30 representing the person who has the data
* ActivityName - It can be one of these values: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING

## Variables

There are 66 different measurments for each Subject-Activity dyad.

Each variable can be identified according to the following naming standart. (For more information on measurments visit the website of the experiment here: (http://archive.ics.uci.edu/ml/machine-learning-databases/00240/UCI%20HAR%20Dataset.names)

1) Variables starting with "FrequencyDomain" contains data after the Fast Fourier Transform.
2) Variables starting with "TimeDomain" contains raw data, before the Fast Fourier Transform.
3) Variables ending with "Mean" or "MeanX/Y/Z" contains the mean value of the data or for its axis.
4) Variables ending with "Std" or "StdX/Y/Z" contains the standard deviation of the data or for its axis.
5) The middle of the variable name contains what exactly is the data and its procedence, if it was taken from the accelerometer or from the gyroscope.

* FrequencyDomainBodyAccelerometerJerkMeanX
* FrequencyDomainBodyAccelerometerJerkMeanY
* FrequencyDomainBodyAccelerometerJerkMeanZ
* FrequencyDomainBodyAccelerometerJerkStdX
* FrequencyDomainBodyAccelerometerJerkStdY
* FrequencyDomainBodyAccelerometerJerkStdZ
* FrequencyDomainBodyAccelerometerMagnitudeMean
* FrequencyDomainBodyAccelerometerMagnitudeStd
* FrequencyDomainBodyAccelerometerMeanX
* FrequencyDomainBodyAccelerometerMeanY
* FrequencyDomainBodyAccelerometerMeanZ
* FrequencyDomainBodyAccelerometerStdX
* FrequencyDomainBodyAccelerometerStdY
* FrequencyDomainBodyAccelerometerStdZ
* FrequencyDomainBodyBodyAccelerometerJerkMagnitudeMean
* FrequencyDomainBodyBodyAccelerometerJerkMagnitudeStd
* FrequencyDomainBodyBodyGyroscopeJerkMagnitudeMean
* FrequencyDomainBodyBodyGyroscopeJerkMagnitudeStd
* FrequencyDomainBodyBodyGyroscopeMagnitudeMean
* FrequencyDomainBodyBodyGyroscopeMagnitudeStd
* FrequencyDomainBodyGyroscopeMeanX
* FrequencyDomainBodyGyroscopeMeanY
* FrequencyDomainBodyGyroscopeMeanZ
* FrequencyDomainBodyGyroscopeStdX
* FrequencyDomainBodyGyroscopeStdY
* FrequencyDomainBodyGyroscopeStdZ
* TimeDomainBodyAccelerometerJerkMagnitudeMean
* TimeDomainBodyAccelerometerJerkMagnitudeStd
* TimeDomainBodyAccelerometerJerkMeanX
* TimeDomainBodyAccelerometerJerkMeanY
* TimeDomainBodyAccelerometerJerkMeanZ
* TimeDomainBodyAccelerometerJerkStdX
* TimeDomainBodyAccelerometerJerkStdY
* TimeDomainBodyAccelerometerJerkStdZ
* TimeDomainBodyAccelerometerMagnitudeMean
* TimeDomainBodyAccelerometerMagnitudeStd
* TimeDomainBodyAccelerometerMeanX
* TimeDomainBodyAccelerometerMeanY
* TimeDomainBodyAccelerometerMeanZ
* TimeDomainBodyAccelerometerStdX
* TimeDomainBodyAccelerometerStdY
* TimeDomainBodyAccelerometerStdZ
* TimeDomainBodyGyroscopeJerkMagnitudeMean
* TimeDomainBodyGyroscopeJerkMagnitudeStd
* TimeDomainBodyGyroscopeJerkMeanX
* TimeDomainBodyGyroscopeJerkMeanY
* TimeDomainBodyGyroscopeJerkMeanZ
* TimeDomainBodyGyroscopeJerkStdX
* TimeDomainBodyGyroscopeJerkStdY
* TimeDomainBodyGyroscopeJerkStdZ
* TimeDomainBodyGyroscopeMagnitudeMean
* TimeDomainBodyGyroscopeMagnitudeStd
* TimeDomainBodyGyroscopeMeanX
* TimeDomainBodyGyroscopeMeanY
* TimeDomainBodyGyroscopeMeanZ
* TimeDomainBodyGyroscopeStdX
* TimeDomainBodyGyroscopeStdY
* TimeDomainBodyGyroscopeStdZ
* TimeDomainGravityAccelerometerMagnitudeMean
* TimeDomainGravityAccelerometerMagnitudeStd
* TimeDomainGravityAccelerometerMeanX
* TimeDomainGravityAccelerometerMeanY
* TimeDomainGravityAccelerometerMeanZ
* TimeDomainGravityAccelerometerStdX
* TimeDomainGravityAccelerometerStdY
* TimeDomainGravityAccelerometerStdZ