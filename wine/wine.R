# predicting the quality of wines using regression trees (CART) and model tree
# Author: Kaushik Balakrishnan, PhD; Email: kaushikb258@gmail.com



wine <- read.csv("whitewines.csv")

str(wine)

hist(wine$quality)


wine_train <- wine[1:3750, ]
wine_test <- wine[3751:4898, ]

# need rpart package for CART
library(rpart)

m <- rpart(quality ~ ., data = wine_train)

m

summary(m)

library(rpart.plot)

rpart.plot(m, digits = 3)

rpart.plot(m, digits = 4, fallen.leaves = TRUE, type = 3, extra = 101)

p <- predict(m, wine_test)

summary(p)
summary(wine_test$quality)


cor(p, wine_test$quality)


MAE <- function(a, p) {
  return(mean(abs(a - p)))
}

MAE(p, wine_test$quality)

mean(wine_train$quality)

MAE(5.87, wine_test$quality)




#---------------------------------------------------------------


# Model tree using the M5 algorithm

library(RWeka)

m <- M5P(quality ~ ., data = wine_train)

m

summary(m)


p <- predict(m, wine_test)

summary(p)

cor(p, wine_test$quality)

MAE(wine_test$quality, p)










