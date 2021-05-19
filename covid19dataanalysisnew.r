library(covid19.analytics)
library(prophet)
library(ggplot2)
library(dplyr)
library(lubridate)

tsc=covid19.data(case='ts-confirmed')
tsc=tsc%>%filter(Country.Region=='US')
tsc

tsc=data.frame(t(tsc))
#Changing date,index to variable
tsc= cbind(rownames(tsc), data.frame(tsc, row.names=NULL))


#Giving Column Names

colnames(tsc)=c('Date','Confirmed')
tsc=tsc[-c(1:4),]
tsc

summary(tsc)

#converting date tonumeric

tsc$Date=ymd((tsc$Date))

tsc$Date =ymd((tsc$Date))
tsc$Confirmed=as.numeric(tsc$Confirmed)

qplot(Date,Confirmed,data = tsc,main='Covid 19 Confirmed Cases in USA')             
