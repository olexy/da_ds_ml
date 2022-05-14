rm(list=ls())

data(mtcars)
View(mtcars)
summary(mtcars)

#Outlier removal
LT=mean(mtcars$hp)-2*sd(mtcars$hp)
UT=mean(mtcars$hp)+2*sd(mtcars$hp)


LT
UT
#threshold

mtcars$hp=ifelse(mtcars$hp>UT,median(mtcars$hp),mtcars$hp)
summary(mtcars)

#remove scale effect from data
#Mean=0 & SD=1

#(obs-mean)/sd

 (22.8-20.09)/sd(mtcars$mpg)
 0.4496471
?scale

mtcars.scale=scale(mtcars)

View(mtcars.scale)
summary(mtcars.scale)

library(usdm)
library(sp)
library(raster)

a=as.data.frame(mtcars.scale)

# Remove multicollinearity
#vifstep(a,th=10)
#VIF=1/(1-R2)
vif(a)
a1=a[,-6]

vif(a1)
a2=a1[,-2]
vif(a2)

# Kmeans

?kmeans
M1=kmeans(a2, centers=1)

names(M1)
M1$cluster

M1$tot.withinss

wss=M1$tot.withinss
wss

kmeans(a2, centers=2)
kmeans(a2, centers=2)$withinss

kmeans(a2, centers=2)$tot.withinss

#wss=kmeans(a2, centers=i)$tot.withinss
#Thumb Rule - sqrt of observations is optimal k
sqrt(32)

M1=kmeans(a2, centers=1)

wss=M1$tot.withinss
wss


for(i in 1:15)
{set.seed(1234)
  wss[i]=kmeans(a2, centers=i)$tot.withinss}

wss

#scree plot
plot(wss)

plot(1:15,wss, type="b", xlab="No. of Clusters", ylab="Within Group Sum of Squares ")

# Analysing cluster results
#max 6 or 5 clusters are good to have
#3,5,6,8

set.seed(1234)
M2= kmeans(a2,5)

names(M2)
M2$cluster

table(M2$cluster)

M2$centers

M2$cluster

mtcars$cluster=M2$cluster

View(mtcars)

C1=subset(mtcars,cluster==1)
summary(C1)

# Create clusters using Germancredit data
# create cluster of customers using Unibank data

library(caret)
data(GermanCredit)
View(GermanCredit)

# #Hierarchical clustering
# View(mtcars)
# data(mtcars)
# View(mtcars)
# summary(mtcars)
# 
# #Outlier removal
# 
# LT=mean(mtcars$hp)-2*sd(mtcars$hp)
# UT=mean(mtcars$hp)+2*sd(mtcars$hp)
# 
# LT
# UT
# #threshold
# 
# mtcars$hp=ifelse(mtcars$hp>UT,UT,mtcars$hp)
# 
# #remove scaling effect from data
# ?scale
# mtcars.scale=scale(mtcars)
# View(mtcars.scale)
# summary(mtcars.scale)
# 
# library(usdm)
# library(sp)
# library(raster)
# 
# a=as.data.frame(mtcars.scale)
# 
# # Remove multicollinearity
# vif(a)
# a1=a[,-3]
# 
# vif(a1)
# a2=a1[,-2]
# vif(a2)
# 
?dist

#calculate distances between observations
dist.mtcars=dist(a2, method='euclidean')

#remember n*(n-1)/2 --- 
(32*31)/2

?hclust
hc=hclust(dist.mtcars)

# Visualization of hclust
plot(hc)
plot(hc,hang=-1)
View(mtcars)

# Add rectagle around 4 groups
rect.hclust(hc, k=3, border=2:5)

 names(hc)
 hc$order
  hc$labels

G1=hc$order[1:15]
G1
C1= hc$labels[G1]
C1

G2=hc$order[16:22]
C2=hc$labels[G2]
C2  

G3=hc$order[23:32]
C3=hc$labels[G3]
C3 

