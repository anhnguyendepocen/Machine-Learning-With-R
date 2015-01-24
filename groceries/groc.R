# Using Association Rules to predict patterns in grocery data
# Author: Kaushik Balakrishnan, PhD; Email: kaushikb258@gmail.com


library(arules)

g <- read.transactions("groceries.csv", sep = ",")

summary(g)

inspect(g[1:5])

itemFrequency(g[, 1:3])
itemFrequencyPlot(g, support = 0.1)
itemFrequencyPlot(g, topN = 20)

image(g[1:5])
image(sample(g, 100))

apriori(g)

grules <- apriori(g, parameter = list(support = 0.006, confidence = 0.25, minlen = 2))

grules
summary(grules)

inspect(grules[1:3])
inspect(sort(grules, by = "lift")[1:5])

berryrules <- subset(grules, items %in% "berries")
inspect(berryrules)

write(grules, file = "groceryrules.csv", sep = ",", quote = TRUE, row.names = FALSE)

grules_df <- as(grules, "data.frame")

str(grules_df)



