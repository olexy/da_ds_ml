
#UniBank=read.csv("C:/Users/punkmule/Box/Kapil/Personal/Analytics/Ethans/Statistics/Classification/UniversalBank.csv", header=TRUE)
View(UniBank)
# library(lattice)
# library(ggplot2)
library(caret)

names(UniBank)
sum(UniBank$Personal.Loan)

summary(UniBank)

UniBank1=UniBank[,-c(1,5,9)]
summary(UniBank1)

UniBank1$Experience=ifelse(UniBank1$Experience<0,0,UniBank1$Experience)

#creating groups of variables
#to make it easier to interprete
#Theme/scenarios

?cut
#Used to create age groups of with break points and covnert the field into factor
UniBank1$AgeClass=cut(UniBank1$Age, c(20,30,40,50,60,max(UniBank1$Age)),
                      labels=c("21-30","31-40","41-50","51-60",">60"))

# Q - Age>32 ---XX -Apr/ YY-rej
# Q - Agegroup :21-30, 41-50, 51-60 : Appr, else 31-40, >60 - rejected

summary(UniBank1)

UniBank1$IncomeClass=cut(UniBank1$Income, c(0,30,50,80,110,150,max(UniBank1$Income)),
                         labels=c("0-30","31-50","51-80","81-110","111-150",">150"))

summary(UniBank1)
UniBank1=UniBank1[,-c(1,3)]

#convert variables as factors
UniBank1$Personal.Loan=as.factor(UniBank1$Personal.Loan)
UniBank1$Securities.Account=as.factor(UniBank1$Securities.Account)
UniBank1$CD.Account=as.factor(UniBank1$CD.Account)
UniBank1$Online=as.factor(UniBank1$Online)
UniBank1$CreditCard=as.factor(UniBank1$CreditCard)
UniBank1$Education=as.factor(UniBank1$Education)
UniBank1$Family=as.factor(UniBank1$Family)

summary(UniBank1)
View(UniBank1)

library(caret)
set.seed(2017)
inTrain=createDataPartition(UniBank1$Personal.Loan, p=0.7,list=FALSE)

training=UniBank1[inTrain,]
testing=UniBank1[-inTrain,]

View(training)

library(rpart)
#install.packages("rpart.plot")
library(rpart.plot)

?rpart
names(training)
#CART - classification & regression
#class- decision trees (categorical variable)
#regression tree - dependent var : continuous numeric : anova

fit=rpart(Personal.Loan ~ .,  data=training)
rpart.plot(fit)

rpart.plot(fit,cex=0.7)
rpart.plot(fit,extra=3,cex=0.7)

summary(testing)

?predict
View(testing)
Pred=stats::predict(fit,newdata=testing,type="class")
Pred
View(Pred)

a=table(testing$Personal.Loan, Pred, dnn=list("actual","predicted"))
a
caret::confusionMatrix(a,positive='1')

#Regression Tree : dep var is continuous numeric
?rpart
mt=mtcars
m1=rpart(mpg~.,mt)
rpart.plot(m1)

summary(m1)

b1=predict(m1,mt)
b1

# mpg=B0+vs*B1+B2*cyl+.....

#Practice Assignments
#GermanCredit data to build a classification tree
#Load iris data and build decision tree for predicting species

data("iris")
View(iris)
?rpart

##Randomforest 

library(caret)
data("GermanCredit")
a=GermanCredit

View(a)

abc=createDataPartition(a$Class,p=0.7,list = FALSE)

test=a[-abc,]
train=a[abc,]
summary(train)

#set.seed(2)
library(randomForest)
?randomForest
F1=randomForest(Class~., data = train,ntree=1000)

aa=predict(F1,test,type = "vote")
View(aa)

aa1=ifelse(aa[,2]>0.5,"Good","Bad")
aa1

table(test$Class,aa1)

library(e1071)
library(caret)
caret::confusionMatrix(table(test$Class,aa1),positive='Good')
?confusionMatrix

#Practice Assignments
#Randomforest on Unibank
