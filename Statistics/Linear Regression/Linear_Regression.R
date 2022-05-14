rm(list = ls())

setwd("C:/Users/punkmule/Box Sync/Kapil/Personal/Analytics/Ethans/Statistics/Regression")
House=read.csv("house_R1.csv", header=TRUE)

View(House)

?lm
names(House)

fit=lm(Price~area, data=House)

# Dep~independent
# Dep~ind1+ind40+ind33
# Dep~.
# Dep~.-ind50-ind45

names(fit)
fit
fit$coefficients
fit$residuals
fit$fitted.values
House$Price

#Ho:Indepent variable is not influencing dependent variable
#P lo- null go (0.01<0.05)
summary(fit)

#price=98.25+0.1098*area

#setwd("C:/Users/punkmule/Desktop/Kapil/Personal/Analytics/Ethans/Statistics/")

#Housing=read.csv("C:/Users/punkmule/Box Sync/Kapil/Personal/Analytics/Ethans/Statistics/Regression/HousingData_data.csv", header=TRUE)

View(Housing)
summary(Housing)

#price = B0+B1size+B2bath+B3bed+B4garage

# f1=lm(SellingPrice000s~.,data=Housing)
# summary(f1)
Housing=Housing[,-1]

#check relation between dependent and independents
#checking 1st assumption of multi linear regression
plot(Housing)

cor(Housing)

#Check multicollinearity
install.packages(c("raster"))
library(sp)
library(raster)
library(usdm) ##for VIF

#multicollinearity/vif is checked only for ind var
names(Housing)
?vif
vif(Housing[,-1])

# vif threshold - 5
# vif=1/(1-R2)
# 5=1/(1-R2)
# 5-5*R2=1
# 4=5R2
# R2=4/5=80%
# R2=0.8
# 1/(1-0.8)

#1/(1-R2)
# names(Housing)
a1=lm(HouseSize00Sqft~NumberofBathrms+NumberofBedrms+GarageSize,data=Housing)

summary(a1)
#vif=1/(1-R2)
1/(1-0.848)

# Variables      VIF
# 1 HouseSize00Sqft 6.577989
# 2 NumberofBathrms 3.792467
# 3  NumberofBedrms 5.826416
# 4      GarageSize 5.679113

vif(Housing[,-1])

vif(Housing[,c(-1,-2)])
vif(Housing[,c(-1,-2,-4)])

?vifstep
vifstep(Housing[,-1], th=5)

#Price=B0+B1bath+B2garage

#Approach using VIF
names(Housing)
fitvif=lm(SellingPrice000s~NumberofBathrms+GarageSize,data=Housing)
summary(fitvif)

#You can also check multicollinearity post building the model

#Method:1 - significance

fit1=lm(SellingPrice000s~., data=Housing)
summary(fit1)

fit2=lm(SellingPrice000s~HouseSize00Sqft+NumberofBedrms+NumberofBathrms, data=Housing)
summary(fit2)

fit3=lm(SellingPrice000s~HouseSize00Sqft+NumberofBathrms, data=Housing)
summary(fit3)

fit4=lm(SellingPrice000s~HouseSize00Sqft, data=Housing)
summary(fit4)

# fit31=lm(SellingPrice000s~NumberofBathrms, data=Housing)
# summary(fit31)

vif(Housing[,c(2,3)])

#Price= 7.9*housesize+30.34*no. of bath-12.34

names(fit3)
fit3$fitted.values
Housing$SellingPrice000s
fit3$residuals

##Method 2 :step
# Housing=read.csv("HousingData.csv", header=TRUE)
# Housing=Housing[,-1]
# #View(Housing)

fit1=lm(SellingPrice000s~HouseSize00Sqft+NumberofBedrms+NumberofBathrms + GarageSize, data=Housing)
summary(fit1)
?step
#Akaike information criterion
#AIC : balance accuracy and complexity

fit5=step(fit1)
?step

summary(fit5)

summary(fit3)

plot(fit3)
dev.off()

#check for autocorreleation
install.packages("lmtest")
library(zoo)
library(lmtest)
dwtest(fit3)
#H0:there is no auto-correlation amongst residuals, 
#i.e. they are independent
#in case of regression, we need high p value so that we cannot reject the null


Housing$SellingPrice000s
names(fit3)
fit3$fitted.values
fit3$residuals

#MAPE - mean absolute percentage Error
fit3$residuals #Error

fit3$residuals/Housing$SellingPrice000s #PE

abs(fit3$residuals/Housing$SellingPrice000s) #APE

mean(abs(fit3$residuals/Housing$SellingPrice000s)) #MAPE

#How to predict
?predict
#predict(fit3, newdata=House1)
a=predict(fit3)
fit3$fitted.values
a=as.data.frame(predict(fit3))
a

Housing1=Housing

Housing1$HouseSize00Sqft=Housing1$HouseSize00Sqft*1.1

Housing1=Housing1[,-1]

H1=predict(fit3,newdata=Housing1)
H1

#Practice Assignments:
#mtcars - use mpg as dependent and rest all as independent variables
 #-- wt,

#Airquality data - decide dep and ind and build reg model

data(airquality)
View(airquality)

sd()
