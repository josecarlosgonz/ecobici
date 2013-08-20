#!/usr/bin/Rscript
### Import data
## http://api.citybik.es/

library(RJSONIO)

help(RJSONIO)

data  <- fromJSON("http://api.citybik.es/ecobici.json")

str(data) #Explore a bit
varNames <- names(data[[1]]) #get var names

data  <- do.call(rbind.data.frame, data) #Unlist data
names(data)  <- varNames

summary(data)
data$addres[1]