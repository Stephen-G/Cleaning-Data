require(plyr)
#Acquire Data Sets
xtrain <- read.table("UCI HAR Dataset/train/X_train.txt") 
ytrain <- read.table("UCI HAR Dataset/train/y_train.txt") 
subjecttrain <- read.table("UCI HAR Dataset/train/subject_train.txt") 

xtest <- read.table("UCI HAR Dataset/test/X_test.txt") 
ytest <- read.table("UCI HAR Dataset/test/y_test.txt") 
subjecttest <- read.table("UCI HAR Dataset/test/subject_test.txt") 

features <- read.table("UCI HAR Dataset/features.txt")
activity <- read.table("UCI HAR Dataset/activity_labels.txt")

#Manipulate X Data 
list <- grep("mean|std",features$V2)
XCombined <- rbind(xtest,xtrain)
CleanedX <- XCombined[,list]
names(CleanedX) <- features[list, 2]

#Manipulate Y Data 
YCombined <- rbind(ytest,ytrain)
CleanedY <- merge(YCombined,activity,sort=FALSE)
names(CleanedY) [2] <- "Activity"

#Maipulate Subject Data
SubjectData <- rbind(subjecttest,subjecttrain)
names(SubjectData) <- "Subject"

#Combine Data Sets
TidyData <- data.frame(SubjectData,CleanedY$Activity,CleanedX)
names(TidyData)[1] <- c("Subject")
names(TidyData)[2] <- c("Activity")

#Averages Table
Averages <- ddply(TidyData, .(Subject,Activity), function(x) colMeans(x[,3:79]))
write.table(Averages,"Averages.txt",row.name=FALSE)
