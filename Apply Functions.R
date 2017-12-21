getwd()
setwd("./Weather-Data/Weather Data")

#Read Data
#row.names = We are giving names for the rows in the matrices
Chicago <- read.csv("Chicago-F.csv", row.names=1)
NewYork <- read.csv("NewYork-F.csv", row.names=1)
Houston <- read.csv("Houston-F.csv", row.names=1)
SanFrancisco <- read.csv("SanFrancisco-F.csv", row.names=1)

Chicago
NewYork
Houston
SanFrancisco

#these are dataframes:
is.data.frame(Chicago)

#Let's convert to matrices:
Chicago <- as.matrix(Chicago)
NewYork <- as.matrix(NewYork)
Houston <- as.matrix(Houston)
SanFrancisco <- as.matrix(SanFrancisco)

#check
is.matrix(Chicago)

#Creating the list
Weather <- list(Chicago=Chicago, NewYork=NewYork, Houston=Houston, SanFrancisco=SanFrancisco)

Weather

#Let's try it out:
Weather[3]
Weather[[3]]
Weather$Houston

#using Apply
?apply

apply(Chicago, 1, mean)
#check
mean(Chicago["DaysWithPrecip",])

Chicago
apply(Chicago, 1, max)
apply(Chicago, 1, min)

#for practice
apply(Chicago, 2, max)
apply(Chicago, 2, min)

#Compare
apply(Chicago, 1, mean)
apply(NewYork, 1, mean)
apply(Houston, 1, mean)
apply(SanFrancisco, 1, mean)

#Recreating the apply function with loops (advanced topic)
Chicago
#find the eman of every row:
#1. via loops
output <- NULL #Preparing an empty vector
for(i in 1:5) { #run cycle
  output[i] <- mean(Chicago[i,])
}
#Let's see the result:
output
#Let's add the names to the vector
names(output) <- rownames(Chicago)

#2. via apply function
apply(Chicago, 1, mean)

#Using lapply()
?lapply

Chicago

#Invert rows and columns
t(Chicago)
t(Weather$Chicago)

lapply(Weather, t) #list t(Weather$Chicago) t(Weather$NewYork), t(Weather$Houston), t(Weather$SanFrancisco)

mynewlist <- lapply(Weather, t)
mynewlist

#example 2
Chicago
rbind(Chicago, NewRow=1:12)
lapply(Weather, rbind, newRow=1:12)

#example 3
?rowMeans
rowMeans(Chicago) #identical to: apply(Chicago, 1, mean)
lapply(Weather, rowMeans) #the same result of the previous function

#rowMeans
#colMeans
#rowSums
#colSums

#Combining lappy with [] operator
Weather
Weather[[1]][1,1]
Weather$Chicago[1,1] 
lapply(Weather, "[", 1, 1)

#Getting the first row of every element
lapply(Weather, "[", 1, )

#Getting the data from only March in each element
lapply(Weather, "[", , 3)

#Adding your own functions
lapply(Weather, rowMeans)
Weather

#Get the first row for each element
lapply(Weather, function(x) x[1,])

#Get the 5° row for each element
lapply(Weather, function(x) x[5,])

#Get the 12° column for each row
lapply(Weather, function(x) x[,12])

lapply(Weather, function(z) z[1,] -z[2,])
lapply(Weather, function(z) round((z[1,] -z[2,])/z[2,],2))

#Using sapply()

#AvgHigh_F for July:
lapply(Weather, "[", 1, 7)
#AvgHigh_F for July with the output in a list:
sapply(Weather, "[", 1, 7)

#AvgHigh_F for 4th quarter:
lapply(Weather, "[", 1, 10:12)
sapply(Weather, "[", 1, 10:12)

#Another example:
lapply(Weather, rowMeans)
sapply(Weather, rowMeans)
round(sapply(Weather, rowMeans),2)

#Another example:
lapply(Weather, function(z) round((z[1,] -z[2,])/z[2,],2))
sapply(Weather, function(z) round((z[1,] -z[2,])/z[2,],2))

#Nesting Apply Functions
Weather
lapply(Weather, rowMeans)

Chicago
apply(Chicago, 1, max)

#apply across whole list
lapply(Weather, apply, 1, max)
#tidy up:
sapply(Weather, apply, 1, max)
sapply(Weather, apply, 1, min)

#Very advanced topic
#which.max
Chicago
which.max(Chicago[1,])
names(which.max(Chicago[1,]))

#We will have: apply - to iterate over rows of the matrix
#and we will have: lapply or sapply - to iterate over components of the list
apply(Chicago, 1, function(x) names(which.max(x)))

lapply(Weather, function(y) apply(y, 1, function(x) names(which.max(x))))
sapply(Weather, function(y) apply(y, 1, function(x) names(which.max(x))))

lapply(Weather, function(y) apply(y, 1, function(x) names(which.min(x))))
sapply(Weather, function(y) apply(y, 1, function(x) names(which.min(x))))