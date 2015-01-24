# Analysis of data on used cars

cars <- read.csv("usedcars.csv")

str(cars)
summary(cars$year)
summary(cars[c("price", "mileage")])
range(cars$price)
diff(range(cars$price))
IQR(cars$price)
quantile(cars$price)
quantile(cars$price, probs = c(0.01, 0.99))
quantile(cars$price, seq(from = 0, to = 1, by = 0.2))
hist(cars$price, main = "Histogram of used car prices", xlab = "$")
hist(cars$mileage, main = "Histogram of used car mileage", xlab = "Miles")
var(cars$price)
sd(cars$price)
var(cars$mileage)
sd(cars$mileage)
table(cars$year)
table(cars$model)
table(cars$color)

model_table <- table(cars$model)
color_table <- table(cars$color)
color_pct <- prop.table(color_table)*100

plot(x = cars$mileage, y = cars$price, main = "Scatter plot", xlab = "Miles", ylab = "$")

# need gmodels package for CrossTable
library(gmodels)

cars$cons <- cars$color %in% c("Black", "Gray", "Silver", "White")
table(cars$cons)
CrossTable(x = cars$model, y = cars$cons)
