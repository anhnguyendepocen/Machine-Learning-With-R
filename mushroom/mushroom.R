# Classify mushrooms as edible/poisonous using the 1R and RIPPER rule algorithms
# Author: Kaushik Balakrishnan, PhD; Email: kaushikb258@gmail.com


m <- read.csv("mushrooms.csv", stringsAsFactors = TRUE)
m$veil_type <- NULL

table(m$type)

# need RWeka for OneR and JRip
library(RWeka)

# One R rule learner
m_1R <- OneR(type ~ ., data = m)
m_1R
summary(m_1R) 


# RIPPER algorithm
m_JRip <- JRip(type ~ ., data = m)
m_JRip




