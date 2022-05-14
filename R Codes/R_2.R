#Types of data structures
#(Vector, factor, matrix, dataframe, list, array)
e=3
vector/factor
datafrmes
list
matrix

#Vector (numeric, character, logical)
a=1

?c

y=c(1,1,2,3,4) #combines all arguements to make a vector. Vectors are specific data type with in R which we will learn about in detail later
y

y[3]

length(y)
y[length(y)]
y[5]

x=1
x1=1

b="India"

?c

v1=c(x,x1,y,x,x,x,x,x,x1,1,2,3,5,x,x1,y,x,x,x,x,x,x1,1,2,3,5,x,x1,y,x,x,x,x,x,x1,1,2,3,5)

v1

v1[41]

length(v1)
v1[length(v1)]
v1[51]

b=1:100
b
1:10

v1[41:50]

?seq
# pull positions 2,4,6,8,....50

# b1=1.1:10
# b1

b1=1:10

b1
v1[b1]
v1[4]
v1[11:30]

v1[c(51,1,7,3,13,28)]

v1[c(13,28)]

v2=v1[c(13,28)]
v2

#insert
c(v1,22,23)
v1=c(v1,22,23)
v1

v1=c(50,v1)
v1

v1[1:2]
v1[3:54]
v1=c(v1[1:2],c(50,49,101,3000),v1[3:54])
v1

#?append

#replace

v1[1]
v1[1]=5
v1

#vector members can be referred by their position. A -ve index results in excluding that position and keeping all others
x1=c(11,211,355)

x1[3] # 3rd position value

x1[-3]

x2=x1[-3] # exclude the position, return everything else
x2

x1[-4]
x1[4]
x1[c(-1,-3)]
x1[-c(1,3)]
x1[c(-1,-2,-3)]

x3=x1[c(-1,-2,-3)]
x3

x1[c(3,3,3,3,1,2,1,2,2)]

x1[-1]
x1[2]
x1[c(-1,2)]

rm(x)

b="India"
c=c(v1,b)
c

d1=c("Kapil","Pune","Stats")
d1
d1[2:3]

d1[3]

d1[c(1,3)]

#Logical vector
L2=c(TRUE,FALSE,T,F)
L2

L=0:7
L

1<5

L<5 #returns a logical vector satisfying condition of values less than 5
L1=L<5 
L1

sum(1,2,3)
sum(L)

sum(L<5)#to know how many values are less than 5 
sum(L1)
L
L[L<5]

L[L1]
L[!L1]

L<5
L[L<5]
sum(L[L<5]) 

sum(L<5)

#Factor
?factor
x=factor(c("a","b","a","b","c","c"))
x

y=factor(c(1,2,2,3,4,1,5,3,2,3,"a","b","c"))
y

d=as.factor(c)
d
#0,1--numeric---0:1

#########################

summary(c)
summary(x)
summary(y)
summary(L1)
summary(L)

#Matrix
?matrix

m1=matrix(c(1,2,3,4,5),nrow=2,ncol=4)
m1

m1[2,2]
m1[8]

m1[2,]
m1[,4]
m1

m2=matrix(c(1,2,3,4,5,6,7),nrow=3,ncol=2,byrow = T)
m2
m2[4]

m2[c(1,5)]

m2[c(1,3)]=c(100,200)
m2

#[Row,Column]
m1
m1[2,1]
m1[6]

m1[c(2,4,6)]

m2
m2[2]
m2[2,]
m2[,2]

m2[5]
m2[1,2]
m2[2,2]=7
m2
View(m2)

m1[,-2]

m1[c(-1,-3)]

m3=m1[c(-1,-3)]
m3
m4=m1[-1,-3]
m4

m1[1,3]

?matrix
help(matrix)

#Assign names to rows and columns for m1
#3 rows and 2 columns, R1,R2,R3..C1,C2
#fill data row wise


#####

#making a dataframe
?data.frame
n = c(2,3,5) 
s = c("aa", "bb", "aa") 
b = c(TRUE, FALSE, TRUE) 
df = data.frame(n,s,b)

#as.data.frame
View(df)
df
summary(df)

?as.data.frame
m2=matrix(c(1,2,3,4,5,6,7),nrow=3,ncol=2,byrow = T)
m2
df_m2=as.data.frame(m2)

df
df[2,1]
#[Row,Column]

df[,c(1,3)]
df1=df[-3,]
df1

df[2]
df[,2]

names(df)
df[,1]
df$n
df$n[3]

names(df)

df[2,2]

df$s
df$s[2]

sum(df$n)
median(df$n)

df$n[2]

df[2,1]

df$n
df["n"]
df[1]
df[,1]

df[,c("n","s")]
df[,c(1,2)]

df[c(1,2),]

#[Rows,Colums] -- RC /ROCK 
#Replace
df$n
df$n[3]

df$n[3]=4
df

length(df$n)

#insert a variable in DF
df$i=df$n
df
df$i=c(1,2,3)
df

df=df[,-1]
df

df=df[,c(3,1,2)]
df

#cbind,rbind

n = c(2,3,5) 
s = c("aa", "bb", "aa") 
b = c(TRUE, FALSE, TRUE) 
df = data.frame(n,s,b)

df$m=c(10,11,12)
df
df1=df[,-c(3:4)]
df1
df[-c(1,2),]

df$e=sum(df$m)
df

df[,c(2,3,1)]
df=df[,c(2,3,1)]

df
df=df[,c("n","b","s")]
df

df=df[c(3,2,1),c(3,2,1)]
df

?t
#referring to different values within a dataframe
df
df[1,1] # specified position value
df[,1] # data from 1st column
df[1,] # returning data from 1st row
df[1] # df[,1]

df$s

df$s[1]

df
#Get first & 3rd column













df[,c(1,3)]





df[,-2]

df[,c("n","s")]

#Get first 2 columns and 2nd & 3rd row









df[c(2,3),c(1,2)]

df[-1,-3]

#ncol, nrow

#Creating a list
a=c(1,2,3,4,5,6,7)
c=c("matrix","snatch","lotr")
z=c(T,F,T)

n = c(2, 3,5) 
s = c("aa", "bb", "aa") 
b = c(TRUE, FALSE, TRUE) 
df = data.frame(n, s, b)
df

m1=matrix(c(1,2,3,4,5),nrow=2,ncol=3)
m1

list1=list(a,c,z,df,m1)
View(list1)

list1

list1[4] #inquiring- what is there at 4th level

list1[[4]] #reach/start accessing the data

list1[4][2,2] # No luck
list1[[4]][2,2]

list1[[4]]
list1[[4]]$b
list1[[4]]$b[2]
list1[[4]][2,3]

list1[1]

list1[[1]]

list1[[1]][2]

list1[[2]][2]

list1[[5]]

list1[[5]][6]

list1[[4]]
list1[[4]][3,3]

list1[[4]]$b
list1[[4]]$b[3]

list1[[5]]
list1[[5]][2,2]

#passing names to list object while creation
list2=list(V1=a,V2=c,V3=z,Data1=df,Mat1=m1)
names(list2)
list2

list2[[4]]
list2$Data1

list2[[1]][2]
list2$V1
list2$V1[2]

list2$Mat1

list2$Mat1[2,2]
list2$Mat1[4]

list2$Data1

list2$Data1[2,'b']
list2$Data1[2,3]
list2$Data1$b[2]

list3=list(V1=a,V2=b,V3=z,Data1=df,Mat1=m1,list=list2)
list3

#list3>>list>>Data1>>n>>3
list3$list
list3$list$Data1
list3$list$Data1$n
list3$list$Data1$n[3]



#list3>>Mat1>>1

list3$Mat1[6]

#list3>>list>>V2>>"lotr"
list3$list$V2[3]

#list3>>Dat1>>s>>'bb'
list3$Data1$s[2]

#list3>>list>>Data1>>b>>1 st true

list3

#list>>list>>DF>>n>>3>>5 is to be replaced with 4




#list3>>list>>Mat1>>repalce lat 1 with 6


#How to refer elements within vector
#[]/[[]] : To return specific values specified position
#() : Used for calling functions
#$ can only be used when we have named levels within objects

?class

a=1.73
class(a)
class(list1)
class(df)

is.
is.integer(a)
is.character(a)
is.numeric(a)

is.data.frame(a)

a
as.
a=as.integer(a)
a
class(a)

a10=as.data.frame(a)
a10

as.
as()
a11=as(a,"character")
a11
class(a11)

#Assigning values to data structure (Import/Export)
#import from excel
#.csv (Comma separated values)
#.txt(table with space separated in text format)
#minitab, SAS, SPSS
?read.csv
DF3=read.csv("C:/Users/punkmule/Box/Kapil/Personal/Analytics/Simplilearn/2020/Datasets/Lesson 7_Regression Analysis/Demo 1_Perform simple linear regression.csv")
#CTRL+F
DF2 = read_excel("C:/Users/punkmule/Box/Kapil/Personal/Analytics/Simplilearn/2020/R Codes/covid.xlsx", sheet = "Sheet1")

?read.csv #preferred
?write.csv #preferred
?class
#read_xlsx /read_excel
#ctrl+F  #find & replace
?write.csv

write.csv(df,file="C:/Users/punkmule/Box/Kapil/Personal/Analytics/Simplilearn/2020/R Codes/df.csv",sep="|")

# Explore functions cbind,rbind
# ncol, nrow
# paste

##apply function
m1=matrix(c(1,2,3,4,5),nrow=2,ncol=3)

m1
?apply
# [R,C]
# 1,2 - margin
m1
#m2=m1[,c(1,2)]

apply(m1,2,sum) #column
apply(m1,1,sum) #row

apply(m1,2,mean) #column

apply(m1,1,mean) #row

#dplyr

#R>>packages>>functions

library(dplyr)

?mtcars
mtcars
View(mtcars)


data("airquality")
a=airquality
b=mtcars

View(mtcars)

mtcars

library(dplyr)
#select
?select
a1=select(mtcars, mpg, hp, disp)
View(a1)

select(mtcars, mpg:hp)

names(mtcars)

mtcars[,1:3]
mtcars[,c("mpg","hp","am")]
mtcars[,c(2:5)]

#assignment - use the same on data iris
data(iris) # subset first 2 columns using select and using []
View(iris)

a1=iris

#filter
?filter
filter(mtcars, cyl==4)
filter(mtcars, am==0)

filter(mtcars, am==0 & mpg>20)

select(filter(mtcars, am==0 & mpg>20),mpg,am,hp)

a1=filter(mtcars, (cyl==4 | cyl==6) & mpg>20)
a1

#Filter iris data for setosa & versicolor flower species

#arrange
?arrange
View(mtcars)
a2=arrange (mtcars,am)
View(a2)

a2=arrange (mtcars,-am,mpg)
?arrange
View(a2)

a3=arrange(mtcars,-am,mpg)
a3

#0 1 2 #asc 0 1 2
#0 -1 -2 #asc : -2  -1 0

#assignment - explore order function
#?order,?sort

#head(mtcars,5)

#mutate
mtcars$new2=mtcars$mpg*1.1
View(mtcars)

mtcars=mutate(mtcars,new3=mpg*1.1)

View(mtcars)

#summarize
summary(mtcars)

summarize(group_by(mtcars,am), mean(mpg))

summarize(group_by(mtcars,am),mean(wt))

summarise(group_by(iris,Species),mean(Petal.Length))

#aggregate
aggregate(mpg~am,data=mtcars,mean)

aggregate(mpg~am+cyl,data=mtcars,mean)
?sum
# 
# 
# b=aggregate(sales~store,data=retail,sd)
# 
# 
aggregate(wt~am,data=mtcars,sd)

aggregate(Petal.Length~Species,iris,mean)

#median, sd,var

aggregate(wt~am,data=mtcars,sd)
aggregate(wt~vs+cyl+am,data=mtcars,median)

sd(mtcars$mpg)

##Conditional statements
#if-else statement example

#if <<logical check>> {what if true} else {what if false}
#if(){}else{}

x=2

if(x==3){  
  print("this is true")
} else
{  print ("this is false")}

##simplified

ifelse(x==5,T,F)

#if>>T/F>>if

# s>60:Good
# s=60:average
# s<60:poor

s=55

ifelse(s==60,"Average",ifelse(s>60,"Good","Poor"))

#Very bad (<40),bad(40-60), average==60,good(60-80), very good (>80)

#using if-else on a vector
#OR

x=1:10
#If the value is less than or equal to 3 then return the value
#or If the value is greater than or equal to 8 then return the value
#else return 0
x
y=ifelse(x<=3 | x>=8,x,0) #1,2,3,8,9,10....
y

# 1 2 3 4 5 6 7 8 9 10
# 1 2 3 0 0 0 0 8 9 10

##and
x=1:10
y=ifelse(x<=5 & x>=2 ,T,F) #2,3,4,5
y

#Switch
#ML algorith can give value of a3 as A/B/C/D/E/F/G
a3="A"
switch (a3,
        A={b=a1*5; 
            c=b^2+5;
            d=c*2;
            c("Aprroved",b,c,d)},
        B={c("Rejected",a1)})

#Looping

#for

# 1+5
# 2+5
# 3+5
# 4+5
# i+5

for (kapil in c(10,22,12)) 
{
  print(kapil+5)
}

for (i in 1:10) 
{
  print(i^2)
}

out=T

for(itr in 1:nrow(mtcars))
{
 out[itr]= mtcars$mpg[itr]>20
}

out
data(mtcars)

row.names(mtcars[out,])

# i j (0,1) (0,1)
# 0 0
# 0 1 
# 1 0
# 1 1
# i j

print(c(0,0))
print(c(0,1))
print(c(1,0))
print(c(1,1))
print(c(i,j))

for (i in 0:1) {   #i:1
  for (j in 0:1) {   #j:1
    print(c(i,j))    #1,1
    }
}

000
001
010
...
111

#While

error=0.15

while (error>=0.05)
{
  ##ML Model for looping ##error
  error=error-0.01
  print(error)
}

#repeat
error=0.15

i=0

repeat 
{
  ##ML Model for looping
  #if(error<0.05){break}
  i=i+1
     if(i>10){break}
  error=error-0.01
  print(error)
}
 