# Ho : fan life >=15000
# Ha : fan life<15000
# Ha less than : lower tail test
x=14900
mu=15000
s=110
n=40

z=(x-mu)/(s/(sqrt(n)))
z

#p-value
p=pnorm(z,lower.tail = T) #pvalue
p
p<0.05

4.472854e-09 # 0.0000000004472 # p value--- compare with LoS(0.05)
0.0000000004472<0.05

#P Low Null GO
#claims is rejected that fan runs for 15000 hrs


# Ho: less than or equal to 4
# Ha/H1 : greater than 4>>> upper tailed

x=4.2
mu=4
s=0.5
n=70

z=(x-mu)/(s/(sqrt(n)))
z
#p-value
pnorm(z,lower.tail = F) #pvalue

class(p)

#Regression
null hypothesis 

o/p-pvalue

P lower than 0.05 then reject null hyp
