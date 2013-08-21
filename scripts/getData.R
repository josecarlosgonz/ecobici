#!/usr/bin/Rscript
### Import data
## http://api.citybik.es/

library(RJSONIO)

getData <- function(){
  if(file.exists("ecobici.csv")==TRUE){
    print("File exists...appending data")
    timeStampMX  <- Sys.time()-3600 #Mexico City's time zone
    data  <- fromJSON("http://api.citybik.es/ecobici.json")
    varNames <- names(data[[1]]) #get var names
    data  <- do.call(rbind.data.frame, data) #Unlist data
    names(data)  <- varNames
    data$timeMX  <- timeStampMX
    temp  <- read.csv("ecobici.csv")
    data <- rbind(temp,data)
    write.csv(data,"ecobici.csv", row.names=F)
    
  } else{
    print("no File.... getting data from API")
    timeStampMX  <- Sys.time()-3600 #Mexico City's time zone
    data  <- fromJSON("http://api.citybik.es/ecobici.json")
    varNames <- names(data[[1]]) #get var names
    data  <- do.call(rbind.data.frame, data) #Unlist data
    names(data)  <- varNames #assign var names
    data$timeMX  <- timeStampMX
    write.csv(data,"ecobici.csv", row.names=F)
  }
  
}

getData()
