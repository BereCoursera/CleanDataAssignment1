Human Activity Recognition data Tidy Data
-----------------------------------------------------

This program tidies up data. It assumes the current working directory contains the folder structure of UCI HAR Dataset (http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones). It has three functions: getTidyData, getMeanStandardDivData and getAverageForEachVariable. 

It reads the data files first and column binds the subject and the label to the training/testing sets. It then row binds these two sets to create the tidy dataset. To select the mean & sd variables, it uses grep function.


usage
-tidyData<-getTidyData()
-tidyDataOnlySDAndMean<- getMeanStandardDivData(tidyData)
-tidyMeanBySubjectAndLabel<-getAverageForEachVariable(tidyData)
