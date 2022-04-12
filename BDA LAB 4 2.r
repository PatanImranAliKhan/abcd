# generate random observations from the two populations

x <- rnorm(20, mean=100, sd=5) # normal distribution centered at 100

y <- rnorm(20, mean=105, sd=5) # normal distribution centered at 105

# Student's t-test

t.test(x, y) # run the Student's t-test

## OUTPUT

##  Two Sample t-test

## 

## data:  x and y

## t = -2.4198, df = 28, p-value = 0.02227

## alternative hypothesis: true difference in means is not equal to 0

## 95 percent confidence interval:

##  -10.1274147  -0.8416843

## sample estimates:

## mean of x mean of y 

##  99.69104 105.17559

# obtain t value for a two-sided test at a 0.05 significance level

qt(p=0.05/2, df=28, lower.tail= FALSE)

## [1] 2.048407

# Welch's t-test
t.test(x, y) # run the Welch's t-test
## 
##  Welch Two Sample t-test
## 
## data:  x and y
## t = -2.4671, df = 19.062, p-value = 0.02326
## alternative hypothesis: true difference in means is not equal to 0
## 95 percent confidence interval:
##  -10.1364866  -0.8326124
## sample estimates:
## mean of x mean of y 
##  99.69104 105.17559
# Wilcoxon Rank-Sum Test
wilcox.test(x, y, conf.int = TRUE)
## 
##  Wilcoxon rank sum test
## 
## data:  x and y
## W = 51, p-value = 0.03112
## alternative hypothesis: true location shift is not equal to 0
## 95 percent confidence interval:
##  -9.7690674 -0.4057088
## sample estimates:
## difference in location 
##              -4.590953
## section 3.3.6 ANOVA
offers <- sample(c("offer1", "offer2", "nopromo"), size=500, replace=T)
# Simulated 500 observations of purchase sizes on the 3 offer options
purchasesize <- ifelse(offers=="offer1", rnorm(500, mean=80, sd=30),
                       ifelse(offers=="offer2", rnorm(500, mean=85, sd=30),
                              rnorm(500, mean=40, sd=30)))
# create a data frame of offer option and purchase size
offertest <- data.frame(offer=as.factor(offers),
                        purchase_amt=purchasesize)
# display a summary of offertest where offer="offer1"
summary(offertest[offertest$offer=="offer1",])
##      offer      purchase_amt   
##  nopromo:  0   Min.   : 11.46  
##  offer1 :152   1st Qu.: 56.46  
##  offer2 :  0   Median : 85.02  
##                Mean   : 82.67  
##                3rd Qu.:102.69  
##                Max.   :181.96
# display a summary of offertest where offer="offer2"
print(offertest)
summary(offertest[offertest$offer=="offer2",])
##      offer      purchase_amt   
##  nopromo:  0   Min.   : 10.93  
##  offer1 :  0   1st Qu.: 60.11  
##  offer2 :173   Median : 83.91  
##                Mean   : 81.99  
##                3rd Qu.:103.40  
##                Max.   :160.55
# display a summary of offertest where offer="nopromo"
summary(offertest[offertest$offer=="nopromo",])
##      offer      purchase_amt   
##  nopromo:175   Min.   :-49.95  
##  offer1 :  0   1st Qu.: 15.10  
##  offer2 :  0   Median : 40.13  
##                Mean   : 38.58  
##                3rd Qu.: 56.68  
##                Max.   :116.29
# fit ANOVA test
model <- aov(purchase_amt ~ offers, data=offertest)
summary(model)
##              Df Sum Sq Mean Sq F value Pr(>F)    
## offers        2 217532  108766   116.9 <2e-16 ***
## Residuals   497 462599     931                   
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
# Tukey's Honest Significant Difference (HSD) on all
# pair-wise tests for difference of means
TukeyHSD(model)
##   Tukey multiple comparisons of means
##     95% family-wise confidence level
## 
## Fit: aov(formula = purchase_amt ~ offers, data = offertest)
## 
## $offers
##                    diff       lwr       upr     p adj
## offer1-nopromo 44.09059 36.138804 52.042373 0.0000000
## offer2-nopromo 43.40717 35.718006 51.096332 0.0000000
## offer2-offer1  -0.68342 -8.656541  7.289701 0.9778672



write.csv(data_frame,
          file = '/Users/dr.vijayasrikompalli/Downloads/data.csv',
          row.names = FALSE,
          na = '0')
data_frame<-read.csv('./data_lab5.csv')
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
