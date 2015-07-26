library(RCurl)


fileurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileurl, destfile = "./UCI_HAR_dataset.zip")
unzip("./UCI_HAR_dataset.zip")

# 1. This part merges the training and the test data sets to create one data set
training <- read.table("./UCI HAR Dataset/train/X_train.txt")
test <- read.table("./UCI HAR Dataset/test/X_test.txt")
xdata <- rbind(training, test)

subj.train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
subj.test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
subj <- rbind(subj.train, subj.test)

ydata.train <- read.table("./UCI HAR Dataset/train/y_train.txt")
ydata.test <- read.table("./UCI HAR Dataset/test/y_test.txt")
ydata <- rbind(ydata.train, ydata.test)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
features <- read.table("./UCI HAR Dataset/features.txt")
mean_sd <- grep("-mean\\(\\)|-std\\(\\)", features[, 2])
xdata.mean_sd <- xdata[, mean_sd]

# 3. Uses descriptive activity names to name the activities in the data set
names(xdata.mean_sd) <- features[mean_sd, 2]
names(xdata.mean_sd) <- gsub("\\(|\\)", "", names(xdata.mean_sd))

activities <- read.table('UCI HAR Dataset/activity_labels.txt')
#activities[, 2] <- tolower(as.character(activities[, 2]))
#activities[, 2] <- gsub("_", "", activities[, 2])

ydata[, 1] = activities[y[, 1], 2]
colnames(ydata) <- "activity"
colnames(subj) <- "subject"

# 4. Appropriately labels the data set with descriptive activity names.
data <- cbind(subj, xdata.mean_sd, ydata)
write.table(data, "./merged.txt", row.names = F)

# 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
average.df <- aggregate(data, by=list(activities=data$activity, subj=data$subject), FUN=mean)
average.df <- average.df[, !(colnames(average.df) %in% c("subj", "activity"))]
write.table(average.df, "./average.txt", row.names = F)
