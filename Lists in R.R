#Lists in R

#Deliverable - a list with followin components
#Character: machine name
#Vector: (min, mean, max) Utilization for the month (excluding unknown hours)
#Logical: Has utilization ever fallen below 90%? TRUE/FALSE
#Vector: All hoours where utilization is unknown (NA's)
#Dataframe: For this machine
#Plot: For all machines

#Getting the default path
getwd()
#Setting the default path
#setwd("C:\Users\krinaldi\Documents\R\R-Programming-Advanced-Analytics-In-R-For-Data-Science\Machine-Utilization.csv")

#Loading the csv file into a data.frame variable
util <- read.csv("Machine-Utilization.csv")

util
str(util)
head(util, 12)
summary(util)

#Derive utilization column
util$Utilization = 1 - util$Percent.Idle
