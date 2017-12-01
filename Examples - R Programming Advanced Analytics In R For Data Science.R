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