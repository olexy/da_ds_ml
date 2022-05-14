
##### #################################### Activate libraries #####################################
# install packages, if needed, and then load the packages.
install.packages("pacman")
library(pacman)  # No message.

pacman::p_load(pacman, dplyr, ggplot2, lubridate, raster, psych, usdm, car) 

# install.packages(c("raster"))
# install.packages("lubridate")
# install.packages("dplyr") 
# install.packages("psych", dependencies = TRUE)
library(psych)
library("dplyr")
library(sp)
library(raster)
library(usdm)
library("lubridate")
library(plotrix)

detach("package:usdm", unload=TRUE)
library(car)


#Import the dataset
wss <- read.csv("~/R_files/Project/Walmart/Walmart_Store_sales.csv")
View(wss)

wss$Store=as.factor(wss$Store)
wss$Date=as.Date(wss$Date, format="%d-%m-%Y")
str(wss)

# rm(wss)

########## Question 1 ##########
#find maximum Weekly Sales based on the Store category 
top_sales <- aggregate(Weekly_Sales~Store,data=wss,max) 
top_sales

#find the maximum Weekly
top_sales %>% 
  filter(Weekly_Sales == max(Weekly_Sales, na.rm = TRUE)) 

############## END ##############

########## Question 2 ##########
#find standard deviation  of Weekly sales based on the Store category & put in object std_dev
std_dev <- aggregate(Weekly_Sales~Store,data=wss,sd) 
std_dev 
#rename column name
colnames(std_dev)<-c("Store","Stdev") 
std_dev 

#find the maximum standard deviation of weekly sales and pass to variable max_std
max_std <- std_dev %>%
  filter(Stdev == max(Stdev, na.rm = TRUE)) 
max_std

#output the mean of std_dev object variable Stdev
mean(std_dev$Stdev) 

#output summary std_dev object
summary(std_dev) 

#find coefficient of standard variation
cosd <- max_std$Stdev/mean(std_dev$Stdev) 
#output coefficient of standard variation
cosd                                      
############## END ##############


########## Question 3 ##########
# Install & load lubridate

# Extract year and Quarter into a columns
wss$Year <- year(wss$Date)         
wss$Quarter <- quarter(wss$Date)

# Install & load dplyr

wss %>%  slice(1:220)

wss %>% 
  select(Year, Quarter, Weekly_Sales)

# df <- wss %>% filter(Year==2012, Quarter>=2 & Quarter<4)
# df

df2 <- wss %>% filter(Year==2012, Quarter==2)
df2

#find sum of Weekly Sales based on the Store category for data subset df2
top_sales_df2 <- aggregate(Weekly_Sales~Store,data=df2,sum) 
#rename column name
colnames(top_sales_df2)<-c("Store","Q2_Sales_Total") 
top_sales_df2

df3 <- wss %>% filter(Year==2012, Quarter==3)  
df3

#find sum of Weekly Sales based on the Store category 
top_sales_df3 <- aggregate(Weekly_Sales~Store,data=df3,sum)
#rename column name
colnames(top_sales_df3)<-c("Store","Q3_Sales_Total") 
top_sales_df3

#Coloumn Bind df2 and df3
#df <- cbind(top_sales_df2,top_sales_df3)
#df

#Merge df2 and df3 by Store
df4 <- merge(top_sales_df2,top_sales_df3, by="Store", all=T)
df4

#Extract growth into a column
df4$Growth <- (df4$Q3_Sales_Total - df4$Q2_Sales_Total)/ df4$Q2_Sales_Total
df4

#Indentify positive growth
df5 <- df4 %>%
  filter(Growth>0)
df5

#Plot the df5
barplot(df5$Growth, ylim =c(0,0.2), names = df5$Store, xlab = "Store", ylab = "Growth", main = "2012 Quarter 2 & 3 Positive Growth", col = c(2, 5, 7, 3))

############## END ##############


########## Question 4 ##########
#filter non-holidays sales
nh_df <- wss %>%
  filter(Holiday_Flag == 0)
nh_df

#find non-holidays sales mean by store
nh_sm <- aggregate(Weekly_Sales~Store,data=nh_df,mean)
#rename column name for weekly_sales to Sales_Mean
colnames(nh_sm)<-c("Store","Sales_Mean_nh") 
nh_sm

#filter holidays sales into data frame
h_df <- wss %>%
  filter(Holiday_Flag == 1)
h_df

#filter holiday sales mean by date
hsd_sm <- aggregate(Weekly_Sales~Date,data=h_df,mean)
colnames(hsd_sm)<-c("Date","Sales_Mean_h") 
hsd_sm

# Compare columns  different dataframe with nested for loop

for(i in 1:length(nh_sm)) { 
  for (j in 1:length(hsd_sm)) {
    if (nh_sm$Sales_Mean_nh[i] < hsd_sm$Sales_Mean_h[j]){
      hsd_sm$Status = "Y"
  }
  else{  
    hsd_sm$Status[j] = "N"
   }
  }
}

hsd_sm

#filter dates with higher means sales
hh_df <- hsd_sm %>%
  filter(Status == "Y")
hh_df

#Plot the hh_df
barplot(hh_df$Sales_Mean_h, names = hh_df$Date, xlab = "Holiday Dates", ylab = "Sales Means", main = "Holidays with higher Sales Means", col = c(2, 5, 7, 3))
############## END ##############


########## Question 5 ##########
# Extract Month and Semester into a columns
wss$Semester <- semester(wss$Date)         
wss$Month <- month(wss$Date, label = TRUE)

# Select 3 columns from the modify wss df
mosm_df <- wss %>% 
  dplyr::select(Month, Semester, Weekly_Sales)

mosm_df

# find sum of sales by Sememster
df_sem_sales <- aggregate(Weekly_Sales~Semester,data=mosm_df,sum)
colnames(df_sem_sales)<-c("Semester","Total_Weekly_Sales")
df_sem_sales

#find sum of sales by Month
df_mon_sales <- aggregate(Weekly_Sales~Month,data=mosm_df,sum)
colnames(df_mon_sales)<-c("Month","Total_Weekly_Sales")
df_mon_sales

#find semester with lowest sums of weekly sales
df_lsm <- df_sem_sales %>%
  filter(Total_Weekly_Sales == min(Total_Weekly_Sales))
df_lsm 
         

#find month with lowest sums of weekly sales
df_lmo <-df_mon_sales %>%
  filter(Total_Weekly_Sales == min(Total_Weekly_Sales))
df_lmo 

#find month with highest sums of weekly sales
df_lmo <-df_mon_sales %>%
  filter(Total_Weekly_Sales == max(Total_Weekly_Sales))
df_lmo

#Bar plot the hh_df
barplot(df_mon_sales$Total_Weekly_Sales, names = df_mon_sales$Month, xlab = "Months", ylab = "Total Sales", main = "Total Weekly Sales By Month", col = c(2, 5))

#3d pie chart plot
pie3D(df_mon_sales$Total_Weekly_Sales,radius=1,col=rainbow(4),labels=c(df_mon_sales$Month), main = "Total Weekly Sales By Month")


########## Question 6 Statistical Model ###############

#Injest dataset afresh
wss.a <- read.csv("~/R_files/Project/Walmart/Walmart_Store_sales.csv")
wss.a$Store=as.factor(wss.a$Store)
wss.a$Date=as.Date(wss.a$Date, format="%d-%m-%Y")
str(wss.a)
View(wss.a)
summary(wss.a)

#Subset Store 1 
df_store1 <- wss.a %>%
  filter(Store == 1)
df_store1

summary(df_store1)
str(df_store1)

##### While developing the model, iteratively analyse variables for
#     - Normality of distribution
#     - Extreme values 
#     - Multiple collinearity
#     - Homoscedasticity (even distribution of residuals)
#     - p-value of coefficients and R2/F-statistic of the model

# fit1=lm(SellingPrice000s~., data=Housing)
# summary(fit1)

#Remove non-numeric variables
# df_store1=df_store1[,-1]
# df_store1=df_store1[,-1]
df_store1=df_store1[,-2]
str(df_store1)

pairs.panels(df_store1, col="red")


#Transform variables 
# log10(5)
# 10 ^ 0.69897

df_store1$Weekly_Sales <- log10(df_store1$Weekly_Sales)
df_store1$CPI <- log10(df_store1$CPI)

pairs.panels(df_store1, col="red")

#Fit the model (1)
fit=lm(Weekly_Sales~., data=df_store1)
summary(fit)

# Check for multi-collinearity with Variance Inflation Factor
# Correlated: none VIF=1, moderately 1<VIF<5, ** highly 5<VIF<10, ...

vif(fit)

### Refit the model (2)
fit=lm(Weekly_Sales~Temperature+Fuel_Price+Unemployment, data=df_store1)
summary(fit)
vif(fit)


### Refit the model (3)
fit=lm(Weekly_Sales~Temperature+Fuel_Price+CPI, data=df_store1)
summary(fit)
vif(fit)


### Refit the model (4)
fit=lm(Weekly_Sales~Temperature+CPI, data=df_store1)
summary(fit)
vif(fit)






