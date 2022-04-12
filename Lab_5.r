library("ggplot2")
library("ggfortify")
df<-iris
summary(df)
head(df)
data1<-select(df,c(1:2))
print(data1)
#K-mean
kmean<-kmeans(data1,3)#2 is number of clusters.
kmean$centers
autoplot(kmean,data1,frame=TRUE)


#wss method
k.max<-15
wss<-sapply(1:k.max,function(k){kmeans(data1,k,nstart = 50,iter.max = 4)})
wss
plot(1:k.max,wss,
     type="b",pch=19,frame=FALSE)
