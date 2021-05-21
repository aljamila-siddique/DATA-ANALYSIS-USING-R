library(covid19.analytics)
library(prophet)  #topredict
library(ggplot2)
library(dplyr)
library(lubridate)  #convertdateformatusingymd

tsc=covid19.data(case='ts-confirmed')
tsc=tsc%>%filter(Country.Region=='US')
tsc

#transpose of a matrix
tsc=data.frame(t(tsc))

#Changing date,index to variable
tsc= cbind(rownames(tsc), data.frame(tsc, row.names=NULL))


#Giving Column Names

colnames(tsc)=c('Date','Confirmed')
tsc=tsc[-c(1:4),]
tsc

summary(tsc)

#converting date tonumeric



tsc$Date =ymd((tsc$Date))
tsc$Confirmed=as.numeric(tsc$Confirmed)

summary(tsc)

qplot(Date,Confirmed,data = tsc,main='Covid 19 Confirmed Cases in USA')             

ds=tsc$Date
y=tsc$Confirmed


df=data.frame(ds,y)
m<-prophet(df)

#making a data frame for future prediction

future<-make_future_dataframe(m,periods=28)
forecast<-predict(m,future)

plot(m,forecast)
dyplot.prophet(m,forecast)

#forecastcomponents

prophet_plot_components(m,forecast)

#MODELPERFOMANCE

pred=forecast