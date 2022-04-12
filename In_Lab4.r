write.csv(df,file='~/data_lab4.csv',row.names = FALSE,NA='0')
df<-read.csv(file='~/data_lab4.csv')
df
col1<-df[,c(1)]
print(col1)
x<-rnorm(col1,mean(col1),sd(col1))
print(x)
col2<-df[,c(2)]
print(col2)
y<-rnorm(col2,mean(col2),sd(col2))
print(y)

#Student t-test.
t.test(x,y,var.equal = TRUE)#student t-test to get T(obs) value.
qt(p=0.05/2,df=18,lower.tail = FALSE)
#Here T(obs)<T(critical value) => Therefore reject null hypothesis.



#Welch Test
t.test(x,y,var.equal = FALSE)
qt(p=0.05,df=11.993)

#wilcoxson Rank Sum
wilcox.test(x,y,conf.int=TRUE)


#Anova Test
model<-aov(Marks~prev_marks,data=df)
print(model)

#Plot the graph
plot(x)
hist(x,breaks=3,main='Normal Distribution')
hist(y,breaks = 5)

