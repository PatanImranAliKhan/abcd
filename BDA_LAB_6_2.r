
product_review<-read.csv("https://raw.githubusercontent.com/KLDataAnalytics/Big-Data-Analytics/master/Amazon%20reviews.csv")
head(product_review[,2])
table(product_review[,2])
nrow(product_review)
library(dplyr)
product_review<-product_review[product_review$rating!=3,]
product_review$rating_new<-ifelse(product_review$rating==4,1,ifelse(product_review$rating==5,1,0))
head(product_review)
product_review
table(product_review$rating_new)
trainingset<-product_review[1:130,]
nrow(trainingset)
testset<-product_review[131:174,]
nrow(testset)
library(tm)
training_set_toy<-product_review[,1]
training_set_toy
typeof(training_set_toy)
training_set_toy<-VectorSource(training_set_toy)
training_set_toy<-VCorpus(training_set_toy)
training_set_toy<-DocumentTermMatrix(training_set_toy)
training_set_toy<-tm_map(training_set_toy,removePunctuation)
training_set_toy<-tm_map(training_set_toy,removeNumbers)
training_set_toy<-as.matrix(training_set_toy)
typeof(training_set_toy)
training_set_toy<-cbind(training_set_toy,product_review$rating_new)
training_set_toy<-as.data.frame(training_set_toy)
install.packages("dplyr")
library(dplyr)
install.packages("magrittr")
library(magrittr)
p_r<-read.csv('https://raw.githubusercontent.com/KLDataAnalytics/Big-Data-Analytics/master/Amazon%20reviews.csv')
head(p_r)
tail(p_r)
names(p_r)
nrow(p_r)
ncol(p_r)
dim(p_r)
str(p_r)
count(p_r,'rating')
install.packages("pander")
library(pander)
pandoc.table(p_r[2:4,1:2], justify = c('left','left'), style = 'grid')

table(p_r$rating)

p_r <- p_r %>% filter(rating != 3) %>%
  mutate(rating_new = if_else(rating >= 4, 1, 0))

p_r_training <-  p_r[1:150, ]

p_r_training

corpus_toy <- Corpus(VectorSource(p_r_training$review))
tdm_toy <- DocumentTermMatrix(corpus_toy, list(removePunctuation = TRUE,
                                               removeNumbers = TRUE))

training_set_toy <- as.matrix(tdm_toy)

training_set_toy <- cbind(training_set_toy, p_r_training$rating_new)

colnames(training_set_toy)[ncol(training_set_toy)] <- "y"

training_set_toy <- as.data.frame(training_set_toy)
training_set_toy$y <- as.factor(training_set_toy$y)
library(caret)
review_toy_model <- train(y ~., data = training_set_toy, method = 'svmLinear3')


test_review_data <- p_r[151:191, ]

test_corpus <- Corpus(VectorSource(test_review_data$review))
test_tdm <- DocumentTermMatrix(test_corpus, control=list(dictionary = Terms(tdm_toy)))
test_tdm <- as.matrix(test_tdm)

#Build the prediction  
model_toy_result <- predict(review_toy_model, newdata = test_tdm)

check_accuracy <- as.data.frame(cbind(prediction = model_toy_result, rating = test_review_data$rating_new))

check_accuracy <- check_accuracy %>% mutate(prediction = as.integer(prediction) - 1)

check_accuracy$accuracy <- if_else(check_accuracy$prediction == check_accuracy$rating, 1, 0)
round(prop.table(table(check_accuracy$accuracy)), 3)

