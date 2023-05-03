#loading library
library(RWeka)

#setting working directory
setwd("/home/heefe/Documents/DMClassWork/")

#checking working directory
getwd()

#Creating Data frame
rating <- 1:4
animal <- c('koala','hedgehog','sloth','panda')
country <- c('Australia','Italy','Peru','China')
avg_sleep_hours <- c(21,18,17,10)

#set stringAsFactors to False
#so that string values are stored as characters and not vector
super_sleepers <- data.frame(rating,animal,country,avg_sleep_hours,stringsAsFactors = FALSE)

print(super_sleepers)

#checking data types
print(class(super_sleepers))

print(str(super_sleepers))

#creating a file(data to be written in file, file, file name)
write.arff(super_sleepers,file("super_sleepers1.arff"))

#read.arff used to read from the file
N = read.arff("super_sleepers1.arff")

print(N)

#print first 2 rows
print(head(N,2))

#print the variable name
names(N)

#print the values of variable 'animal'
N["animal"]