## getTidyData returns a tidy dataset from the Human Activity Recognition data
## assumes it will be run in the folder (i.e setwd("/UCI HAR Dataset/"))
getTidyData<- function(){
        #########
                #train data
        ########
        featureName<-read.table("features.txt")
        trainX<-read.table("train/X_train.txt")
        trainX_lbl<-read.table("train/y_train.txt")
        trainX_s<-read.table("train/subject_train.txt")
        
        # add the subject and label to trainX and name it trainSet
        trainSet<-cbind(trainX_s,trainX_lbl,trainX)
        
        
        #########
                #test data
        ########
        testX<-read.table("test/X_test.txt")
        testX_lbl<-read.table("test/y_test.txt")
        testX_s<-read.table("test/subject_test.txt")
        
        # add the subject and label to testX and name it testSet
        testSet<-cbind(testX_s,testX_lbl,testX)
        
        # merge training and testing data
        data<-rbind(trainSet,testSet)
        # assign the column labels (feature names)
        names(data) <-c("Subject","Label",as.character(featureName$V2))
        data

}

## getMeanStandardDivData given a tidy dataset returns only the mean, standard deviation, Subject and Label variables
getMeanStandardDivData<- function(tidyData){        
        # select only the Subject, Label and *mean and *standard deviation variables
        use<-grep("^Subject$|^Label$|mean|std",names(tidyData))
        
        tidyData[use]
}

## getMeanStandardDivData given a tidy dataset returns only the mean, Subject and Label variables
getAverageForEachVariable<- function(tidyData){        
        tidyData<-getMeanStandardDivData(tidyData)
        s<-split(tidyData, list(tidyData$Subject, tidyData$Label))
        sapply(s, colMeans)
}

#test( as well as saving for submission)
d<-getTidyData()
d2<- getMeanStandardDivData(d)
d3<-getAverageForEachVariable(d)
write.table(d2,"HumanActivityRecognition_Tidy_MeanSD.txt")
write.table(d3,"2.HumanActivityRecognition_Tidy_Mean.txt")