### Analysis
### Get data
source(getData)

library(ggplot2)

qplot(data$lng, data$lat)

str(data$coordinates)

summary(data)
head(data)

qplot(data$free, data$bikes)
length(unique(data$number)) ## Number is the identifier for each station

#Try to change encoding
data$name <- as.character(data$name)
data$name <- encodeString(data$name, 'latin1')
data$name[1:20]
