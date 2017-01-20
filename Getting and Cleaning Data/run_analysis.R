library(dplyr)

run_analysis<-function()
{ 
   # 1 Merges the training and the test sets to create one data set
  
   #Read features and activity file and assign column name
   features<-read.table("features.txt",header = FALSE)
   activity_labels <- read.table("activity_labels.txt")
   colnames(activity_labels)<-c('ActivityID', 'ActivityType');

   #Read and assign column name to all Test Files
   TestsetX <- read.table("./test/X_test.txt")
   colnames(TestsetX) <- features[,2]

   TestsetY<-read.table("./test/y_test.txt")
   colnames(TestsetY)<-"ActivityID"

   Subject_test<-read.table("./test/subject_test.txt")
   colnames(Subject_test)<-"SubjectID"

   #Read and assign column name to all Train Files
   Subject_train<-read.table("./train/subject_train.txt")
   colnames(Subject_train)<-"SubjectID"

   TrainsetX <- read.table("./train/X_train.txt")
   colnames(TrainsetX) <- features[,2]

   TrainsetY<-read.table("./train/y_train.txt")
   colnames(TrainsetY)<-"ActivityID"

   #Combine all test and train data files respectively.

   TestData<-cbind(TestsetY,Subject_test,TestsetX)

   TrainData<-cbind(TrainsetY,Subject_train,TrainsetX)

   #Merge the both combined test and train data files into one

   FinalData<-rbind(TestData,TrainData)


   # 2 Extracts only the measurements on the mean and standard deviation for each measurement.

   FinalData<-FinalData[,c(grepl("ActivityID" , colnames(FinalData)) |
                      grepl("SubjectID" , colnames(FinalData)) |
                      grepl("mean.." , colnames(FinalData)) |
                      grepl("std.." , colnames(FinalData)))]

  # 3 Uses descriptive activity names to name the activities in the data set

   FinalData <- merge( activity_labels,FinalData,by='ActivityID', all.x=TRUE)
   

  # 4 Appropriately labels the data set with descriptive variable names.

   names(FinalData)<-gsub("([Bb]ody[Bb]ody|[Bb]ody)", "Body", names(FinalData))
   names(FinalData)<-gsub("^t", "Time", names(FinalData))
   names(FinalData)<-gsub("^f", "Frequency", names(FinalData))
   names(FinalData)<-gsub("Acc", "Accelerometer", names(FinalData))
   names(FinalData)<-gsub("Gyro", "Gyroscope", names(FinalData))
   names(FinalData)<-gsub("Mag", "Magnitude", names(FinalData))


   # 5 From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
   # Exclude the ActivityType as it's mean is not required.

   FinalAverageData<- select(FinalData,-ActivityType)
   AverageData <- aggregate(. ~SubjectID + ActivityID, FinalAverageData, mean)
   AverageData<-merge(activity_labels, AverageData,by='ActivityID',all.x=TRUE)
   AverageData <- AverageData[order(AverageData$SubjectID, AverageData$ActivityID),]
   
   
   # Writing the data into the file
   write.table(AverageData, "AverageDataSet.txt", row.name=FALSE)

}
