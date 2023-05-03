library(arules)
setwd("/home/heefe/Documents/DMClassWork/")
data("Mushroom")

#extended rule, spot data to generate rules
fprules <- fim4r(Mushroom, method = "fpgrowth", target = "rules", supp = 70, conf = 60)
fprules
#generate rules itself
#display rules
inspect(fprules[1:5])

#converting rules in data frame and storing it in x variable
x <- as(fprules,"data.frame")

write.csv(x, file = "FP.csv", row.names = FALSE)