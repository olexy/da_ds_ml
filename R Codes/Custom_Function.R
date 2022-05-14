#function

sum(1,2,3)

splsum = function(x,y,z)
{
  x^2+y^2+z^2
}

splsum(1,2,3)

sum(1,2,3)

splsum(1,2,3)

sq_splsum=function(x,y,z) 
{
  x
  y
  z
  x+y+z
  x^2+y^2+z^2
  sqrt(x^2+y^2+z^2)
}

sq_splsum(1,2,3) #sqrt of sq sum of 1,2,3,

sqrt(14)

#exercise 1:Create a vector of the values of e^x*cos(x) 
#at x = 3; 3.1; 3.2; ...... 6.
## find value of e online if u dont remember :)----2.718
###Hint:recollect seq function or try ?seq

abc=seq(3,6,0.1)
abc
fcos=function(x) {2.718^x*cos(x)}

f3=fcos(abc)
f3

#exercise 2:Use the function paste to create the 
#following character vectors 
##of length 30
# (a) ("label 1", "label 2", ....., "label 30").
# Note that there is a single space between label and the number following.
# (b) ("fn1", "fn2", ..., "fn30").
# In this case, there is no space between fn and the number following.

custom_Paste=function(x,y,z){paste(x,y,sep=z)}


a="1"
b="23"

paste(a,b,sep="+")

paste(a,b,"+")

# create a custom paste function which doesnt demand argument "sep"

Fun1=function(a,b,C) { paste(a,b,sep=C)}
Fun1(a,b,"+")
Fun1("label",1:30," ")

Fun1("fn",1:30,"")

D5=mtcars
View(D5)
D5$New=Fun1(mtcars$cyl,mtcars$am,"_")
View(D5)

Custom_Paste=function(a) { paste(a,1:30,sep="")}

final_label=Custom_Paste("label")
Custom_Paste("fn")

final_label

fn=fun1("fn",1:30,"")
fn
