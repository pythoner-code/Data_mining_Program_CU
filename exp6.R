library(caTools)
library(e1071)
dataset = read.csv('/home/heefe/Documents/DMClassWork/Social_Network_Ads.csv')
dataset = dataset[3:5]

summary(dataset)
str(dataset)

# Encoding the target feature as factor
dataset$Purchased = factor(dataset$Purchased, levels = c(0, 1))

# Splitting the dataset into the Training set and Test set
split = sample.split(dataset$Purchased, SplitRatio = 0.75)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

# Feature Scaling
training_set[-3] = scale(training_set[-3])
test_set[-3] = scale(test_set[-3])

# Fitting Naive Baiyes Classifier to the Training set
classifier = naiveBayes(x = training_set[-3],
                        y = training_set$Purchased)
print(classifier)

# Predicting train set results
y_pred_train = predict(classifier, newdata = training_set[-3])

# Making the Confusion Matrix for training set
cm_train = table(training_set[, 3], y_pred_train)

print(cm_train)

#Accuracy on training data
accuracy_train <- sum(diag(cm_train))/sum(cm_train)

cat("\nAccuracy on training set: ", accuracy_train)

# Predicting the Test set results
y_pred_test = predict(classifier, newdata = test_set[-3])

# Making the Confusion Matrix for testing set
cm_test = table(test_set[, 3], y_pred_test)
print(cm_test)

# Accuracy on test data
accuracy_test <- sum(diag(cm_test))/sum(cm_test)
cat("\nAccuracy on test set: ", accuracy_test)
