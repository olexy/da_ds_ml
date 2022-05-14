rm(list=ls())

a=read.csv("C:/Users/punkmule/Box/Kapil/Personal/Analytics/Ethans/Statistics/Regression/Marks_1.csv")
  names(a)
  summary(a)
  ?glm

Model=glm(Pass~Hours,data=a,family=binomial(link="logit"))

summary(Model)
names(Model)
Model$fitted.values

#y=1.5*hours-4.077

pred=ifelse(Model$fitted.values>0.5,1,0)
pred
a$Pass

rm(list = ls())

# To Install multiple packages


# install.packages("caret")
# install.packages(c("MASS","ResourceSelection",
#                    "survey","pscl","InformationValue"))

library(caret)
library(lattice)
library(ggplot2)
library(reshape2)

library(caret)
?GermanCredit

data(GermanCredit) #loads the data
View(GermanCredit) #View your data
#head(GermanCredit)
summary(GermanCredit)

# Converting Class variable from Bad/Good to 0/1
GermanCredit$Class=ifelse(GermanCredit$Class=="Bad",0,1)
GermanCredit$Class[1:5]

sum(GermanCredit$Class) #70:30---Good:Bad
#80:20
# We will split our dataset into Train and Test data. The Train dataset will be used to build the model and the Test dataset will used to validate how well our model is performing.
?createDataPartition
set.seed(1234)
inTrain=createDataPartition(GermanCredit$Class, p=0.8,list=FALSE)

Training=GermanCredit[inTrain,]
Testing=GermanCredit[-inTrain,]

sum(GermanCredit$Class)
#1:700,0:300

sum(Training$Class)
800*0.7

559+141
sum(Testing$Class)

fit0=glm(Class~ ., data=Training,family=binomial(link="logit"))

summary(fit0)

step=step(fit0)

summary(step)

fitA=update(step, .~. -Age)
summary(fitA)

fitB=update(fitA, .~. -Property.CarOther)

summary(fitB)

fitC=update(fitB, .~. -Property.RealEstate)
summary(fitC)

fitD=update(fitC, .~. -NumberExistingCredits)
summary(fitD)

fitE=update(fitD, .~. -SavingsAccountBonds.500.to.1000)
summary(fitE)

names(fitE)

fitE$coefficients
names(fitE$coefficients)
 
fitE$fitted.values

?predict
Pred=predict(fitE, newdata=Training, type="response")
Pred

Pred_T=predict(fitE, newdata=Testing, type="response")
Pred_T

View(Pred)
Pred1=ifelse(Pred<0.5,0,1)
View(Pred1)

#install.packages("e1071")
library(e1071)
?table
a=table(Training$Class,Pred1,dnn=list('actual','predicted'))
a
caret::confusionMatrix(a,positive='1')

?confusionMatrix

Pred2=ifelse(Pred_T<0.5,0,1)

#Test Accuracy
a1=caret::confusionMatrix(table(Testing$Class,Pred2,dnn=list('actual','predicted')),positive='1')
a1

#Area under curve (AOC)/ROC Curve
library(survey)
library(survival)
library(InformationValue)
#dev.off()
?plotROC
plotROC(actuals=Training$Class,predictedScores=as.numeric(fitted(fitE)))

fitE$fitted.values

#Practice Assignments
#Predict if a vehicle is automatic or manual - mtcars
#GermanCredit - pick any binary field as dependent and build logistic regression model
