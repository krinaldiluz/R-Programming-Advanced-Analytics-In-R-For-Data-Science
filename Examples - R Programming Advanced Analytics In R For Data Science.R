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

#Resetting the dataframe index
fin <- fin_backup

#Option 1
rownames(fin) <- 1:nrow(fin)

#Option 2
rownames(fin) <- NULL

tail(fin)

#Replacing Missing Data: Factual Analysis

#Check which rows dont have all informations
fin[!complete.cases(fin),]

#Getting the rows with empty state info
fin[is.na(fin$State),]

#Restrict to get just city with New York value
fin[is.na(fin$State) & fin$City=="New York",]

#Change the state from empty to state value where city is equal to New York
fin[is.na(fin$State) & fin$City=="New York","State"] <- "NY"

#check
fin[c(11,377),]
fin[fin$City=="New York",]

#Restrict to get just city with New York value
fin[is.na(fin$State) & fin$City=="San Francisco",]

#Change the state from empty to state value where city is equal to New York
fin[is.na(fin$State) & fin$City=="San Francisco","State"] <- "CA"

#Check
fin[fin$City=="San Francisco",]


#Replacing Missing Data: Median Imputation Method (Part 1)
fin[!complete.cases(fin),]

median(fin[fin$Industry=="Retail","Employees"], na.rm=TRUE)

mean(fin[,"Employees"], na.rm=TRUE)

mean(fin[fin$Industry=="Retail","Employees"], na.rm=TRUE)

#Check the median for the employees column with Retail industry
med_empl_retail <- median(fin[fin$Industry=="Retail","Employees"], na.rm=TRUE)
med_empl_retail

fin[is.na(fin$Employees) & fin$Industry=="Retail",]

#Insert the median in the empty rows for Retail industries
fin[is.na(fin$Employees) & fin$Industry=="Retail"] <- med_empl_retail

#Check:
fin[3,]

median(fin[fin$Industry=="Financial Services","Employees"], na.rm=TRUE)
med_empl_financial <- median(fin[fin$Industry=="Financial Services","Employees"], na.rm=TRUE)
med_empl_financial
fin[is.na(fin$Employees) & fin$Industry=="Financial Services","Employees"] <- med_empl_financial

fin[330,"Employees"]

#Replacing Missing Data: Median Imputation Method (Part 2)
fin[!complete.cases(fin),]

med_growth_constr <-median(fin[fin$Industry=="Construction","Growth"], na.rm=TRUE)
med_growth_constr
fin[is.na(fin$Growth) & fin$Industry=="Construction","Growth"] <- med_growth_constr

#Replacing Missing Data: Median Imputation Method (Part 3)
#Revenue to Construction
med_revenue_constr <- median(fin[fin$Industry=="Construction","Revenue"], na.rm=TRUE)
fin[is.na(fin$Revenue) & fin$Industry=="Construction",]
fin[is.na(fin$Revenue) & fin$Industry=="Construction", "Revenue"] <- med_revenue_constr

#Expenses
med_expenses_constr <-median(fin[fin$Industry=="Construction", "Expenses"], na.rm=TRUE)
med_expenses_constr
fin[is.na(fin$Expenses) & fin$Industry=="Construction" & is.na(fin$Profit),]
fin[is.na(fin$Expenses) & fin$Industry=="Construction" & is.na(fin$Profit), "Expenses"] <- med_expenses_constr

fin[!complete.cases(fin),]

#Replacing Missing Data: Deriving values
#Revenue - Expenses = Profit

fin[is.na(fin$Profit),"Profit"] <- fin[is.na(fin$Profit),"Revenue"] - fin[is.na(fin$Profit),"Expenses"]
fin[c(8,24),]

#Expenses = Revenue - Profit
fin[is.na(fin$Expenses), "Expenses"] <- fin[is.na(fin$Expenses),"Revenue"] - fin[is.na(fin$Expenses),"Profit"]

fin[15,]