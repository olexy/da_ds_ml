
library(RODBC)
con <- odbcDriverConnect("driver=SQL Server; server=database")

df <- data.frame(a=1:10, b=10:1, c=11:20)

values <- paste("(",df$a,",", df$b,",",df$c,")", sep="", collapse=",")
values

cmd <- paste("insert into MyTable values ", values)

result <- sqlQuery(con, cmd, as.is=TRUE)


