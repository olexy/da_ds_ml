#Other classification algorithms

UniBank=read.csv("C:/Users/punkmule/Box/Kapil/Personal/Analytics/Ethans/Statistics/Classification/UniversalBank.csv", header=TRUE)
View(UniBank)
names(UniBank)
library(lattice)
library(ggplot2)
library(caret)

sum(UniBank$Personal.Loan)
summary(UniBank)

UniBank1=UniBank[,-c(1,5,9)]
summary(UniBank1)

#SVM
summary(UniBank1)
library(e1071)
UniBank1$Personal.Loan=as.factor(UniBank1$Personal.Loan)
?svm

a=svm(Personal.Loan~.,UniBank1)

?predict
predict(a)

caret::confusionMatrix(UniBank1$Personal.Loan,predict(a),positive='1')
