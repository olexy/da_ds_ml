rm(list=ls())

#install.packages(c("datasets","arules","arulesViz"))

library(datasets)
library(Matrix)
library(arules)
library(grid)
library(arulesViz)

data(Groceries)
?Groceries
Groceries
summary(Groceries)
#check split function
#?split

?itemFrequencyPlot
?apriori

dev.off()
itemFrequencyPlot(Groceries, topN=50)
# 

0.02*10000
 0.025*10000
 25/9835

rules=apriori(Groceries, parameter=list(supp=0.002,conf=0.8))

inspect(rules)

23*0.82

#support= count of transaction for lhs/total transaction

inspect(rules[1:5])

#dev.off()

?options
options(digits=2)
inspect(rules[1:5])

rules=sort(rules, by="confidence", decreasing=TRUE)
inspect(rules[1:5])

#Creating product specific rules
rules2=apriori(data=Groceries, parameter=list(supp=0.0005,conf=0.7), 
            appearance=list(default="lhs",rhs=c("butter milk")))
rules2
inspect(rules2)

rules2=sort(rules2, by="confidence", decreasing=TRUE)
inspect(rules2[1:5])
# 
# #rules2=sort(rules2, decreasing=FALSE,by="confidence")
# rules2=sort(rules2, decreasing=FALSE,by="lift")

inspect(rules2[1:5])
library(arulesViz)
plot(rules3[1:5], method="graph",engine="interactive",shading=NA)
#Support - Size, color shade-confidence

#re-run considering rhs as some other products

rules3=apriori(data=Groceries, parameter=list(supp=0.001,conf=0.8), 
              appearance=list(default="lhs",rhs="yogurt"))
inspect(rules3[1:4])

rules3=apriori(data=Groceries, parameter=list(supp=0.0005,conf=0.8), 
               appearance=list(default="lhs",rhs=c("butter milk","yogurt")))

rules3
rules3=sort(rules3, decreasing=FALSE,by="confidence")
inspect(rules3[1:10])
?inspect

plot(rules3[1:5], method="graph",engine="interactive", shading=NA)

#Support - Size, color shade-confidence

write(rules3, file="C:/Users/punkmule/Box/Kapil/Personal/Analytics/Simplilearn/2020/statistics/Association Rules/rules3.csv")
?apriori
#If data is not in required format

setwd("C:/Users/punkmule/Box/Kapil/Personal/Analytics/Ethans/Tableau")
data=read.csv("Sample - Superstore Sales (Excel).csv")

names(data)
?split
spt = split(data$Product.Name, data$Order.ID)
#check if we need to use any other field instead
head(spt,3)

txn = as(spt, "transactions")

summary(txn)
24/5500 
#25%>>
#0.44%
2/5500

summary(txn)
rules = apriori(txn, parameter = list(sup = 0.0003, conf = 0.4))

inspect(rules)
names(data)

#Build rules on superstore data using category & sub - categories

spt1 = split(data$Product.Sub.Category , data$Order.ID)
txn1 = as(spt1, "transactions")
summary(txn1)


Kapil Muley
