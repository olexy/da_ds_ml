#Use arthritis data
#Calculate average age of male & female patients

# Create a field to define patients into 6 categories
# A-Treated & improved 12 -- 12/84
# B-Treated & some improvement
# C-Treated & No improvement
# D-Placebo & improved
# E-placebo & some improvement
# F-Placebo & no improvement
#Hint: ifelse
library(vcd)
data("Arthritis")
View(Arthritis)

#calcualte mix for each category

# Use for loop to print below o/p
# 0,0,0
# 0,0,1
# 0,1,0
# 0,1,1
# 1,1,1
# 1,1,0
# 1,0,0
# 1,0,1
# ..... 

#remove missing values (NAs) from airquality data

#Use createDataPartition function to split arthritis data 
#into 2 groups
#group 1 with 60% of data and rest in other group
#need package 'caret'
#D1, D2 #0.6*84

library(caret)

W=createDataPartition(Arthritis$Treatment,p=0.6,list=F)

#Build all charts that we looked at, 
#for any field in mtcars/Arthritis data (other than mpg and cyl)

#Use read.csv("....path") to read any csv file(superstore) and
#using basic function learnt, draw 10 insights
