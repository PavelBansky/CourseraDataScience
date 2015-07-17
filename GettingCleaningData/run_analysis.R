# 1. Merges the training and the test sets to create one data set.

train.x <- read.table("train/X_train.txt")
test.x <- read.table("test/X_test.txt")
data.x <- rbind(train.x, test.x)

train.y<- read.table("train/y_train.txt")
test.y <- read.table("test/y_test.txt")
data.y <- rbind(train.y, test.y)

test.subject <- read.table("test/subject_test.txt")
train.subject <- read.table("train/subject_train.txt")
data.subject <- rbind(train.subject, test.subject)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 

features <- read.table("features.txt")
features.mean.std <- grep("-(mean|std)\\(\\)", features[, 2], perl=TRUE)
data.x <- data.x[, features.mean.std]
names(data.x) <- features[features.mean.std, 2]

# 3. Uses descriptive activity names to name the activities in the data set

activities <- read.table("activity_labels.txt")
data.y[, 1] <- activities[data.y[, 1], 2]
names(data.y) <- "activity"

# 4. Appropriately labels the data set with descriptive variable names. 

names(data.subject) <- "subject"
data.final <- cbind(data.x, data.y, data.subject)

# 5. From the data set in step 4, creates a second, independent tidy data set 
# with the average of each variable for each activity and each subject.

library(plyr)
data.avg <- ddply(data.final, .(subject, activity), function(x) colMeans(x[, 1:66]))

write.table(data.avg, "tidy.txt", row.name=FALSE)