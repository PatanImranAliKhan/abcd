x<-rnorm(10,mean=100,sd=5)
y<-rnorm(20,mean=105,sd=5)
t.test(x,y,var.equal=TRUE)
qt(p=0.05/2,df=28,lower.tail = FALSE)
t.test(x,y,var.equal=FALSE)
wilcox.test(x,y,conf.int=TRUE)
offers<-sample(c("offer1","offer2","nopromo"),size=500,replace=T)
purchasesize<-ifelse(offers=="offer1",rnorm(500,mean=80,sd=30),
  ifelse(offers=="offer2",rnorm(500,mean=85,sd=30),
  rnorm(500,mean = 40,sd=30)))
  offertest<-
  data.frame(offer=as.factor(offers),purchase_amt=purchasesize)
summary(offertest[offertest$offer=="offer1",])
summary(offertest[offertest$offer=="offer2",])
summary(offertest[offertest$offer=="nopromo",])
model<-aov(purchase_amt~offers,data=offertest)
summary(model)