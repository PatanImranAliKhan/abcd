library(naivebayes)
library(dplyr)
library(ggplot2)
library(psych)
data <- read.csv("C:/Users/Sai Ram/Downloads/Telegram Desktop/binary-Naive.csv", header = T)
head(data)
xtabs(~Launch+Rank, data = data)
str(data)
data$Rank <- as.factor(data$Rank)
data$Launch <- as.factor(data$Launch)
pairs.panels(data[-1])
data %>%
  ggplot(aes(x=Launch, y=Thickness, fill = Launch)) +
  geom_boxplot() +theme_bw()+
  ggtitle("Box Plot")
data %>%
  ggplot(aes(x=Launch, y=Spreading, fill = Launch)) +
  geom_boxplot() +theme_bw()+
  ggtitle("Box Plot")
set.seed(1234)
ind <- sample(2, nrow(data), replace = T, prob = c(0.8, 0.2))
train <- data[ind == 1,]
test <- data[ind == 2,]
model <- naive_bayes(Launch ~ ., data = train) 
plot(model) 
p <- predict(model, train, type = 'prob')
head(cbind(p, train))
p1 <- predict(model, train)
(tab1 <- table(p1, train$admit))
p2 <- predict(model, test)
(tab2 <- table(p2, test$admit))