library(data.table)
DF = data.table(x=rnorm(9), y=rep(c("a","b","c"), each=3), z=rnorm(9))
head(DF,3)
DF[,w:=z^2]
DF[,a:=x>0]
DF
DT1 = data.table(x=c("a","b","c","d"),y=1:4)
DT2 = data.table(x=c("a","b1","b"),y=5:7)
setkey(DT1,x)
setkey(DT2,x)
merge(DT1,DT2)
