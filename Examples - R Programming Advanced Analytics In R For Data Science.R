# Configurando um diretório para armazenar os scripts
getwd()
setwd("C:\\Users\\Home\\Documents\\Material de Estudo\\Linguagem R\\R Programming Advanced Analytics In R For Data Science")

# Carrega um csv para a uma variável
#Basic import: fin <- read.csv("Future-500.csv")
fin <- read.csv("Future-500.csv", na.strings=c(""))



# Imprimi a variável
fin

# Top registros da variável
head(fin, 24)

# Últimos 10 registros da variável
tail(fin, 10)

#Tamanho dos registros da variável
str(fin)

#Resumo das informações armazenadas
summary(fin)

#Mudando de não fator para um fator
fin$ID <- factor(fin$ID)

fin$Inception <- factor(fin$Inception)

#Verificando após a alteração
str(fin)
summary(fin)

#Factor Variable Trap (FVT)

#Converting into Numerics For Characters:
a <- c("12", "13", "14", "12", "12")
a
typeof(a)

b <- as.numeric(a)
b
typeof(b)

#Converting into Numerics For Factors:
z <- factor(c("12", "13", "14", "12", "12"))
z
y <- as.numeric(z)
y
typeof(y)

# Correct way to convert factor to numerics
x <- as.numeric(as.character(z))

typeof(x)

#FVT
#fin$Profit <- factor(fin$Profit)

str(fin)

summary(fin)

#fin$Profit <- as.numeric(fin$Profit)

str(fin)
head(fin)

#sub
?sub

fin$Expenses <- gsub(" Dollars", "", fin$Expenses)
fin$Expenses <- gsub(",", "", fin$Expenses)
fin$Revenue <- gsub("\\$", "", fin$Revenue)
fin$Revenue <- gsub(",", "", fin$Revenue)
fin$Growth <- gsub("%", "", fin$Growth)

fin$Expenses <- as.numeric(fin$Expenses)
fin$Revenue <- as.numeric(fin$Revenue)
fin$Growth <- as.numeric(fin$Growth)

#What is an NA (Missing value) ?
?NA

true #1
FALSE #
NA

#Get the first 24 records
head(fin, 24)

fin[!complete.cases(fin),]


fin[fin$Revenue == 9746272,]

#Filtering: using which() for non-missing data
which(fin$Revenue == 9746272)
fin[which(fin$Revenue == 9746272), ]
fin[which(fin$Employees == 45), ]

#Filtering: using is.na() for missing data
head(fin, 24)

fin$Expenses == NA
fin[fin$Expenses == NA,]

#Example
a<- c(1, 24, 543, NA, 76, 45, NA)
is.na(a)

is.na(fin$Expenses)
fin[is.na(fin$Expenses),]

fin[is.na(fin$State),]

#Removing records with missing data

fin_backup <- fin

fin[!complete.cases(fin),]
fin[is.na(fin$Industry),]
fin[!is.na(fin$Industry),] #oposto

#Removing
fin <- fin[!is.na(fin$Industry),]
fin



