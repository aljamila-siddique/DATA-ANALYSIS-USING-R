library(covid19.analytics)
library(prophet)
library(ggplot2)
library(dplyr)
library(lubridate)

tsc=covid19.data(case='ts-confirmed')
tsc=tsc%>%filter(Country.Region=='US')
tsc

tsc=data.frame(t(tsc))
