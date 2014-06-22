xTraining <- read.table("./train/X_train.txt")

# Get feature names from the features file in the base directory
con <- file("./features.txt", "r")
allfeatures <- readLines(con)
close(con)
# The following 2 lines will provide a set of 66 mean and sd variables.
# If you want to include the mean frequencies (weighted average of frquency componponents),
# just uncomment the escape (double backslash) characters in the grep functions below.
# FeatureVector provides the positions of the requires columns.
featureVector <- grep("mean\\(\\)|std()", allfeatures)
# Extract the raw names
featureNames <- grep("mean\\(\\)|std()", allfeatures, value=TRUE)
featureNames <- strsplit(featureNames, " ")
featureNames <-sapply(featureNames, function(x) {x[2]})
# Clean up feature names: Remove illegal characters and "Body".
# Most are body measurements. Gravity measurements are explicitly marked.
# Camel case does not really make labels clearer, so convert to lower case
# to minimize typos and R's "silent failures. Labels are alreaddy long, so
# the initial t and f for time and frequency are not extended.
columns <- tolower(gsub("Body|\\(|\\)|-", "",featureNames))
df <- xTraining[,featureVector]

# Get subject numbers for training set.
subjects <- read.table("./train/subject_train.txt")
# Get training data activity markers.
activity <- read.table("./train/Y_train.txt")

# Add subjects and activities to  training data
trainingData <- cbind( subjects, activity, df)

#Now get the test data
xTest <- read.table("./test/X_test.txt")
df <- xTest[,featureVector]
# Get subject numbers for test set
subjects <- read.table("./test/subject_test.txt")
# Get test data activity markers for test set
activity <- read.table("./test/Y_test.txt")
# Add subjects and activities to  training data
testData <- cbind(subjects, activity, df)
combinedData <- rbind(trainingData, testData)
columns <- c("subject", "activity", columns)
colnames(combinedData) <- columns
# If you want to use the auto-generated names to check columns selection,
# do it now.
combinedData$subject <- as.factor(combinedData$subject)
Get activity description labels from file
con <- file("./activity_labels.txt", "r")
activities <- tolower(readLines(con))
close(con)
# clean labels: correct errors and make consistent with "house style".
activities <-strsplit(activities, " ")
activities <-sapply(activities, function(x) {x[2]})
activities <- tolower(activities)
activities <- gsub("laying", "lyingdown",activities)
activities <- gsub("walking_upstairs", "climbingstairs",activities)
activities <- gsub("walking_downstairs", "descendingstairs",activities)

combinedData$activity <- as.factor(combinedData$activity)
levels(combinedData$activity) <- activities

# Create tidy data set containing the mean of each variable by subject and activity.
install.packages("reshape2")
library(reshape2)
molten <- melt(combinedData, id.vars=c("subject", "activity"))
tidyData <- dcast(molten, subject + activity  ~ variable, fun=mean)
# Write data frame with tidy dataset to a csv file.
write.csv(tidyData, "./tidymeans.csv", row.names=FALSE)
# and tab delimited text file
write.table(tidyData, "./tidymeans.txt", sep="\tab")





