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

