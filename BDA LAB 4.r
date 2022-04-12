write.csv(data_frame,
          file = '/Users/dr.vijayasrikompalli/Downloads/data.csv',
          row.names = FALSE,
          na = '0')
data_frame<-read.csv('/Users/dr.vijayasrikompalli/Downloads/data.csv')
print(data_frame)
col1<-data_frame[,c(1)]
print(col1)
x<-rnorm(col1, mean(col1),sd(col1))
print(x)
col2<-data_frame[,c(2)]
print(col2)
y<-rnorm(col2, mean(col2),sd(col2))
print(y)
# output to be present as PNG file
png(file="dnormExample.png")

# Plot the graph.
plot(x, y)
hist(x, breaks=50,main='Normal Distribution')
hist(y, breaks=50)
# saving the file
dev.off()  
# Student's t-test

t.test(x, y, var.equal=TRUE) # run the Student's t-test
qt(p=0.05/2, df=18, lower.tail= FALSE)