library(caret)

data(GermanCredit) #loads the data
View(GermanCredit)

# Converting Class variable from Bad/Good to 0/1
GermanCredit$Class=ifelse(GermanCredit$Class=="Bad",0,1)

set.seed(1234)
inTrain=createDataPartition(GermanCredit$Class, p=0.8,list=FALSE)

Training=GermanCredit[inTrain,]
Testing=GermanCredit[-inTrain,]

sqrt(800)

library(class)

summary(Training)

?knn
KNN=knn(train=Training,test=Testing,cl=Training$Class,k=25)
KNN
library(caret)
a=caret::confusionMatrix(table(Testing$Class,KNN),positive='1')
a

names(a)
a$byClass
a$byClass[11]

acc=0

for (i in 1:200)
{KNN=knn(train=Training,test=Testing,cl=Training$Class,k=i)
a=caret::confusionMatrix(table(Testing$Class,KNN),positive='1')
acc[i]=a$byClass[11]
}

acc
plot(acc,type='b')
