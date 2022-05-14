rm(list=ls())

?cbind
#cbind, rbind, subset
a1=mtcars
a2=mtcars[1:5,]

a3=rbind(a1,a2)

a4=mtcars[,1:2]

a5=cbind(a1,a4)

#sort, order
?sort
sort(mtcars$mpg)
sort(mtcars$mpg,decreasing = T)

?order
order(mtcars$am,decreasing = T)

#df[c(5,3,4,1,2),]

?order
mtcars[order(mtcars$mpg,decreasing = TRUE),]
mtcars[order(mtcars$am,mtcars$mpg,decreasing = TRUE),]

mtcars[order(-mtcars$am,mtcars$mpg),]

subset(mtcars,am==0)

a6=subset(mtcars,am==1)
a6
subset(mtcars,am==1 & mpg>18)

#join, merge
#RODBC
#function
#R-shiny

#na.omit,  na.roughfix, is.na,
data("airquality")

a10=airquality
View(a10)
summary(a10)

?mean
mean(a10$Ozone)

mean(a10$Ozone,na.rm = T)

summary(a10$Ozone)

#omit
a11=na.omit(a10)
summary(a11)

mean(a11$Ozone)

#na.roughfix
#install.packages("randomForest")
library(randomForest)
?na.roughfix
a12=na.roughfix(a10)

summary(a12)
View(a12)
na.roughfix(a10$Ozone)

#is.na
is.na(a10$Ozone)

a10$Ozone=ifelse(is.na(a10$Ozone),mean(a10$Ozone,na.rm = T),a10$Ozone)
View(a10)
summary(a10)

#sample, set.seed, CreateDatapartition

a=c(1,2,3,4,5,6,7,8,9,10,11)

sample(a,3)

b=sample(a,3)
b

set.seed(1)
sample(a,3) #9 4 7

set.seed(99999)
sample(a,3)

set.seed(1)
sample(a,3)

set.seed(99)
sample(a,3)

?sample

#Createdatapartition

?mtcars
View(mtcars)
sum(mtcars$am)

#13 manual (1)
#19 automatic (0)

13/32
#40:60  Manual:Automatic

#32>> pick 16
16/32
0.4*16 #>> #5-8

View(mtcars)
#install.packages("caret")
library(lattice)
library(ggplot2)
library(caret)

?createDataPartition

set.seed(20)
t=createDataPartition(mtcars$am,p=0.5)
t

T1=t[[1]]
T1

D7=mtcars[T1,]#selected 50%---Train

D8=mtcars[-T1,] #not selected 50% --Test

sum(D7$am)
7/16

#Date Handling
a=  read.csv("C:/Users/punkmule/Box/Kapil/Personal/Analytics/Simplilearn/2021/PG/Project/Project/Walmart_Store_sales.csv")
View(a)

a$Date=as.Date(a$Date,format="%d-%m-%Y")
summary(a)
library(lubridate)
semester(a$Date)
a$month=month(a$Date)
a$qtr=quarter(a$Date)
a$weekday=weekdays(a$Date)
summary(a)

a$weekday=as.factor(a$weekday)
summary(a)

#Data Visualization
install.packages("vcd")
library(grid)
library(vcd)
?Arthritis
View(Arthritis)
summary(Arthritis)


?table
counts = table(mtcars$cyl)
counts

barplot(counts)
?barplot
?plot

barplot(counts,
        main="Simple Bar Plot",
        xlab="Cyl", ylab="Frequency")
?barplot

?barplot
barplot(counts,
        main="Horizontal Bar Plot",
        xlab="Frequency", ylab="Cyl",
        horiz=TRUE)
counts

#stacked and grouped bar plots
counts = table(Arthritis$Improved, Arthritis$Treatment)
counts

barplot(counts)

barplot(counts,
        main="Stacked Bar Plot",
        xlab="Treatment", ylab="Frequency",
        col=c("blue","gray","cyan"))

barplot(counts,
        main="Side by side summary",
        xlab="Treatment", ylab="Frequency",
        col=c("blue", "gray","cyan"),beside = T)

?plot
?barplot

#Pie chart
counts = table(Arthritis$Improved)
counts
?pie
pie(counts)
pie(counts,radius=1)
pie(counts,radius=1.1,col=rainbow(7),init.angle=45)

library(plotrix)
pie3D(counts,radius=1,col=rainbow(5),labels=c(42,14,28))

View(Arthritis)

#histograms
par(mfrow=c(2,2))

?hist
hist(Arthritis$Age) 

hist(Arthritis$Age,
     breaks=5, 
     col=rainbow(5),
     xlab="Age group",
     main="Colored histogram with 6 bins",labels=T)

par(mfrow=c(1,1))

#Kernel density plot
plot(density(Arthritis$Age))

#line chart
View(Arthritis)
?plot
plot(Arthritis$Age)
plot(Arthritis$Age,type="l")
plot(Arthritis$Age,type="b")

#Scatter plot
plot(mtcars$wt,mtcars$mpg)

plot(mtcars$mpg~mtcars$wt)

#boxplots
boxplot(mpg ~ cyl, data=mtcars,
        main="Car Mileage Data",
        xlab="Number of Cylinders",
        ylab="Miles Per Gallon",
        col="firebrick3")
?boxplot

#radar chart /spider chart
library(radarchart)

a=mtcars
group=row.names(mtcars)
a=as.data.frame(group)

mt_radar=cbind(a,mtcars)
View(mt_radar)

mt_radar=mt_radar[1:5,1:3]       
?chartJSRadar
View(mt_radar)

radarchart::chartJSRadar(mt_radar)

#Data Normality check
qqnorm(mtcars$mpg) 
qqline(mtcars$mpg)
