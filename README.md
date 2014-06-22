Repository contents
-------------------
1. README.md (this file)
2. CodeBook.md : code book for data-set
3. run_analysis.R : R script for data tidying and transformation
4. tidymeans.csv : csv output of transformed  and aggregated data (means)

Introduction
------------

run_analysis.R is an R script that extracts the required mean and standard
deviation measurements from a specific study data gathered with Samsung
Galaxy smartphones. Data are recombined into a unified set along with
subject (participant) reference numbers and activity labels. Text labels
are appropriately modified by the script. Users may want to refer to the
code book CodeBook.md in this repository and the original description files
which are listed below.

Assumptions
-----------
The script has been tested under R 3.02 and R 3.1. It requires the Reshape2
package, which can be be installed from a cran mirror. The script  assumes
that the data has been downloaded from:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

As required by the specification, the data should be unzipped and  R's working
directory set to the base directory (i.e: UCR\ HAR\ Dataset).

Data
----
The original data is prepared as supervised learning set. It is  labelled in 
terms of six activities and divided into training and test sets.Training and
test sets are contained in corespondingly named subdirectories. All of the
original data is contained in text files. Columns are space separated.

The following files from the original data are used:

1. ./train/X_train.txt (sensor data)
2. ./train/Y_train.txt (activity markers)
3. ./train/subject_train.txt (subject numbers)
4. ./test/X_test.txt (sensor data)
5. ./test/Y_test.txt (activity markers)
6. ./test/subject_test.txt (subject numbers)
7. ./activity_labels.txt (the six activity labels)
8. ./features.txt (list of the 561 features in the X files)

See these description files in the original zip:

1. ./README.txt
2. ./features_info.txt

Processing
----------
For the training and then the test set: the sensor data, activity markers
and subjects numbers are read in from the corresponding text files. The
561 sensor features are reduced to the 66 features containing mean and
standard deviation data.  Mean frequencies (weighted average of the frequency
components have been purposefully excluded,but can be included by a minor
modification indicated in the code comments.

The column names are cleaned up according to the "house style": Names are
converted to lower case and illegal  characters removed. With the exception
of "gravity", all features describe body movements. Therefore "Body" items
(including duplicates) are removed. The rational for the adopted house style
is that camel case does not help with comprehension in this case, but may lead
to typing errors. The "t" and "f" prefixes denote time and frequency
domains respectively. Given that names are already long, they have
not been expanded.

The activity labels have been similarly modified. For semantic
correctness, "LAYING" has been changed to "lyingdown".

Output
------
The output is a tidy data set with 68 variables and 180 observations.
(30 subjects by 6 activities), The variables are required means for
the relevant features preceded by the subect number and activity label.
Thus, it is possible to look up mean figures by subject and activity.
Arguably, this leads to a rather unwieldy look-up table, but there is
no justifiable basis for horizontal aggregation. The output meets the
the criteria for tidy data as defined by Wickham (see references):

1. Each variable forms a column.
2. Each observation forms a row.
3. Each type of observational unit forms a table.


References
----------

https://github.com/hadley/tidy-data
