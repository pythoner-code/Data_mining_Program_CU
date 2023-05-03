library(RWeka)
setwd("/home/heefe/Documents/DMClassWork/")
Name <- c('Himanshu','Diwakar','Yash','karan','Deba')
Uid <- c(7944,8209,7923,7609,7965)
Subject <- c('Data Mining','Maths','Science','DSA','Java')
Marks <- c(100,90,85,89,95)

students <- data.frame(Name,Uid,Subject,Marks,stringsAsFactors = FALSE)
print(students)

print(class(students))

write.arff(students,file("students1.arff"))
N = read.arff("students1.arff")
print(N)
#print top values 
print(head(N,2))
names(N)
N["Uid"]

min(Marks)
sum(Marks)
mean(Marks)
median(sort(Marks))
sd(Marks)
summary(N)