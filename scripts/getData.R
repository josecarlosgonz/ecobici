#!/usr/bin/Rscript
### Import data
## http://api.citybik.es/

library(RJSONIO)

getData <- function(){
  if(file.exists("ecobici.csv")==TRUE){
    print("File exists...appending data")
    data  <- fromJSON("http://api.citybik.es/ecobici.json")
    varNames <- names(data[[1]]) #get var names
    data  <- do.call(rbind.data.frame, data) #Unlist data
    names(data)  <- varNames
    temp  <- read.csv("ecobici.csv")
    data <- rbind(temp,data)
    write.csv(data,"ecobici.csv", row.names=F)
    
  } else{
    print("no File.... getting data from API")
    data  <- fromJSON("http://api.citybik.es/ecobici.json")
    varNames <- names(data[[1]]) #get var names
    data  <- do.call(rbind.data.frame, data) #Unlist data
    names(data)  <- varNames #assign var names
    write.csv(data,"ecobici.csv", row.names=F)
  }
  
}

getData()
