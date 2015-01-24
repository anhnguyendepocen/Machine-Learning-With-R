

launch <- read.csv("challenger.csv")

str(launch)

lm(launch$distress_ct ~ launch$temperature)
