library(RWeka)
library(partykit)
library(caTools)

#iris is a data frame which has 150 rows and 5 columns info of flower.
iris_data = iris

#print structure
str(iris_data)

#print min, max, mean, median, 1st and 3rd quartile
summary(iris_data)

#split the dataset into train and test data with split ration 0.7
spl = sample.split(iris_data, SplitRatio = 0.7)

dataTrain = subset(iris_data, spl==TRUE)
dataTest = subset(iris_data, spl==FALSE)

#J48 generate unpruned or pruned decision trees
m1 <- J48(Species~., dataTrain) 
summary(m1)

#predict the results of m1 named model
dataTestPred <- predict(m1, newdata = dataTest)
table_matrix <- table(dataTest$Species, dataTestPred)

#print contingency table on prediction
print(table_matrix)

#test accuracy by dividing sum of diagonal matrix with simple
#sum return the sum of all values present in its argument
accuracy_Test <- sum(diag(table_matrix)) / sum(table_matrix)

cat("Test Accuracy is: ", accuracy_Test)

# Initate PDF File
pdf("Iris_decision_plot.pdf", paper="a4")

plot(m1, type="simple")

#Close PDF file
dev.off()