#merging dataset
install.packages("plyr")
?plyr
?dplyr
?join
library(plyr)

df1 = data.frame(CustomerId=c(1:6),Product=c(rep("Toaster",1)
                                             ,rep("Radio",5)))

df1

df2 = data.frame(CustomerId=c(3,4,7,8),State=c(rep("Alabama",3)
                                               ,rep("Ohio",1)))
df2
View(df1)
View(df2)

?join

inner=join(df2,df1,by="CustomerId",type="inner")

inner

left=join(df1,df2,by="CustomerId",type="left")
left

right=join(df1,df2,by="CustomerId",type="right")
right

full=join(df1,df2,by="CustomerId",type="full")
full

?merge

#use merge function to join df1 and df2

merge(df1,df2)#Inner
merge(df1,df2,all.x=T) #Left
merge(df1,df2,all.y=T) #Right
merge(df1,df2,all.y=T,all.x=T) #Right