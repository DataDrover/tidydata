Study design
============
The original data was collected in a study with 30 volunteer subjects
carrying Samsung Galaxy Smart phones. Accelerator and gyro raw data were
filtered and used to calculate the table of features. Video footage was used
to label raw sensor data according to six activities. It was then divided into 
training and test data for supervised learning.

In the set described here, the training and test data have been unified.
Subsequent processing to produce a tidy data set of mean and standard
deviation data is described in the accompanying readme file (README.md).

Code Book
=========

Notes on naming
--------------
As described in the README, the column names are cleaned up according to the
"house style": Names are converted to lower case and illegal  characters removed.
With the exception of "gravity", all features describe body movements. Therefore
"Body" items (including duplicates) are removed. The rational for the adopted house
style is that camel case does not help with comprehension in this case, but may
lead to typing errors. The "t" and "f" prefixes denote time and frequency
domains respectively. Given that names are already long, they have
not been expanded.

The activity labels have been similarly modified. For semantic
correctness, "LAYING" has been changed to "lyingdown".

ID variables:
-------------
subject: integer 1:30 converted to factor
activity:

Activity labels have been converted from their original numeric values to factors

1. walking
2. climbingstairs
3. descendingstairs
4. sitting
5. standing
6. lyingdown


activities have been converted from their original numeric values to factors

1. walking
2. climbingstairs
3. descendingstairs
4. sitting
5. standing
6. lyingdown

Measurement variables
The 66 measurement numbers are all numeric (real numbers). They refer to
accelerator measurements (acc), gyro and calculated "jerk" measurements.
Aside from the gravity measurements, they all refer to body movements. The
modified column names are designed to be easily readable in conjunction
with the original labelling.

Summary table of variables
------------------

| Position | Name | Type |
| 1 |subject | factor (30) |
| 2 |activity | factor (6) |
| 3 |taccmeanx | numeric |
| 4 |taccmeany | numeric |         
| 5 |taccmeanz | numeric |
| 6 |taccstdx | numeric |
| 7 |taccstdy | numeric |
| 8 |taccstdz  | numeric |       
| 9 |tgravityaccmeanx | numeric |
|10 |tgravityaccmeany | numeric |
|11 |tgravityaccmeanz | numeric |
|12 |tgravityaccstdx | numeric |
|13 |tgravityaccstdy | numeric |
|14 |tgravityaccstdz  | numeric |
|15 |taccjerkmeanx | numeric |
|16 |taccjerkmeany | numeric |   
|17 |taccjerkmeanz | numeric |
|18 |accjerkstdx | numeric |
|19 |taccjerkstdy | numeric |
|20 |taccjerkstd | numeric |    
|21 |tgyromeanx | numeric |
|22 |tgyromeany | numeric |
|23 |tgyromeanz | numeric |
|24 |tgyrostdx | numeric |        
|25 |tgyrostdy | numeric |
|26 |tgyrostdz | numeric |
|27 |tgyrojerkmeanx | numeric |
|28 |tgyrojerkmeany | numeric |   
|29 |tgyrojerkmeanz | numeric |
|30 |tgyrojerkstdx | numeric |
|31 |tgyrojerkstdy | numeric |
|32 |tgyrojerkstdz | numeric |    
|33 |taccmagmean | numeric |
|34 |taccmagstd | numeric |
|35 |tgravityaccmagmean | numeric |
|36 |tgravityaccmagstd | numeric |
|37 |taccjerkmagmean | numeric |
|38 |taccjerkmagstd | numeric |
|39 |tgyromagmean | numeric |
|40 |tgyromagstd | numeric |    
|41 |tgyrojerkmagmean | numeric |
|42 |tgyrojerkmagstd | numeric |
|43 |faccmeanx | numeric |
|44 |faccmeany | numeric |     
|45 |faccmeanz | numeric |
|46 |faccstdx | numeric |
|47 |faccstdy | numeric |
|48 |faccstdz | numeric |
|49 |faccjerkmeanx | numeric |
|50 |faccjerkmeany | numeric |
|51 |faccjerkmeanz | numeric |
|52 |faccjerkstdx | numeric |
|53 |faccjerkstdy | numeric |
|54 |faccjerkstdz | numeric |
|55 |fgyromeanx | numeric |
|56 |fgyromeany | numeric |      
|57 |fgyromeanz | numeric |
|58 |fgyrostdx | numeric |
|59 |fgyrostdy  | numeric |
|60 |fgyrostdz | numeric |        
|61 |faccmagmean | numeric |
|62 |faccmagstd | numeric |
|63 |faccjerkmagmean | numeric |
|64 |faccjerkmagstd | numeric |
|65 |fgyromagmean | numeric |
|66 |fgyromagstd | numeric |
|67 |fgyrojerkmagmean | numeric |
|68 |gyrojerkmagstd | numeric | 




 