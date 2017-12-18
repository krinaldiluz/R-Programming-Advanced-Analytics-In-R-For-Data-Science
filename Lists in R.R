#Lists in R

#Deliverable - a list with followin components
#Character: machine name
#Vector: (min, mean, max) Utilization for the month (excluding unknown hours)
#Logical: Has utilization ever fallen below 90%? TRUE/FALSE
#Vector: All hours where utilization is unknown (NA's)
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

#Handling Date-Time in R

?POSIXct
util$PosixTime <- as.POSIXct(util$Timestamp, format="%d/%m/%Y %H:%M")

#TIP: como reorganizar as colunas em um data.frame:
util$Timestamp <- NULL
# Trocando a ordem das colunas
util <- util[,c(4,1,2,3)]

#What is a list?
summary(util)

RL1 <- util[util$Machine=="RL1",]

summary(RL1)

RL1$Machine <- factor(RL1$Machine)

#Character: machine name
#Vector: (min, mean, max) Utilization for the month (excluding unknown hours)
#Logical: Has utilization ever fallen below 90%? TRUE/FALSE

util_stats_rl1 <- c(min(RL1$Utilization, na.rm=T), 
                    mean(RL1$Utilization, na.rm=T),
                    max(RL1$Utilization, na.rm=T))

util_stats_rl1

util_under_90_flag <- length(which(RL1$Utilization < 0.90)) > 0

util_under_90_flag

list_rl1 <- list("RL1", util_stats_rl1, util_under_90_flag)

list_rl1

#Naming components of a list

names(list_rl1)

names(list_rl1) <- c("Machine", "Stats", "LowThresold")

##Another way. Like with dataframes:

## Removing a variable
rm(list_rl1)

##Assigning names during the list creation
list_rl1 <- list(Machine="RL1", Stats=util_stats_rl1, LowThresold=util_under_90_flag)

list_rl1

#Extracting components of a list
#three ways:
#[] - will always return a list
#[[]] - will always return the actual object
#$ - same as [[]] but prettier

list_rl1

list_rl1[1]
list_rl1[[1]]
list_rl1$Machine

list_rl1[2]
typeof(list_rl1[2])

list_rl1[[2]]
typeof(list_rl1[[2]])

list_rl1$Stats

#Access the 3rd element of the second value
list_rl1[[2]][3]
list_rl1$Stats[3]

#Adding and deleting list components
list_rl1

list_rl1[3] <- "New Information"
#Another way to add a component < via the $
#We will add:
#Vector: All hours where utilization is unknown (NA's)
list_rl1$UnknownHours <- RL1[is.na(RL1$Utilization),"PosixTime"]

#Removing a component from a list
list_rl1[4] <- NULL

#!!Notice: Numeration has shifted
list_rl1

#Add another component:
#Dataframe inside a list
list_rl1$Data <- RL1
list_rl1

summary(list_rl1)

str(list_rl1)

#Subsetting a list
list_rl1$UnknownHours[1]
list_rl1[[4]][1]

#Let's proceed...
#Filtering from one component until the third
list_rl1[1:3]
#Filtering the first and the forth component
list_rl1[c(1,4)]

sublist_rl1 <- list_rl1[c("Machine", "Stats")]
sublist_rl1
sublist_rl1[[2]][2]

#Building a timeseries plot
library(ggplot2)

p <- ggplot(data=util)
my_plot <- p + geom_line(aes(x=PosixTime, y=Utilization, colour=Machine), size = 1.2) +
  facet_grid(Machine~.) + 
  geom_hline(yintercept = 0.90, colour = "Gray", size = 1.2,
             linetype=3)



list_rl1$Plot <- my_plot

list_rl1