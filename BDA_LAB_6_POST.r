install.packages('qdap')
library(qdap)
install.packages('dplyr')
library(dplyr)
install.packages('gsubfn')
library(gsubfn)
install.packages('stringr')
library(stringr)
install.packages('tm')
library(tm)
install.packages('SnowballC')
library(SnowballC)
#a
newdata<- readLines('https://raw.githubusercontent.com/KLDataAnalytics/Big-Data-Analytics/master/Tweets.txt')
newdata
glimpse(newdata)
mydata <-VCorpus(VectorSource(newdata))
mydata
my<-mydata$content[[3]]
my
#b
b<-tolower(my)
b
b1<-removePunctuation(b)
b1
d1<-gsub("\\s+"," ",b)
d1
removeWords(b,stopwords('en'))
#c
d2<-gsub("http\\S+\\s*","", b)
d2
#d
dtm<-TermDocumentMatrix(mydata)
dtm
jo<-removeSparseTerms(dtm,sparse=0.75)
jo
#e
mine<-hclust(d=dist(jo,method='euclidean'),method="complete")
mine            
#f
plot(as.dendrogram(mine))
require(graphics)
library(graphics)
plot(rect.hclust(mine,k=2))
