# Configurando um diretório para armazenar os scripts
getwd()
setwd("C:\\Users\\Home\\Documents\\Material de Estudo\\Linguagem R\\R Programming Advanced Analytics In R For Data Science")

# Carrega um csv para a uma variável
fin <- read.csv("Future-500.csv")

# Imprimi a variável
fin

# Top registros da variável
head(fin)

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
