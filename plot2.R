# ------------------------------------------------------------------------
#
# Cousera "Exploratory Data Analysis"
# Project 1 - Plot 2
#
# ------------------------------------------------------------------------
#
# Set system locale and load required packages
Sys.setlocale("LC_TIME", "C") # for english days in plot
library(dplyr) # for convenient data manipulation
#
#
# ------------------------------------------------------------------------
#
# Read data, transform attributes to date/time, subset data
setwd("~/Dropbox/ExData_Plotting1") # make sure Coursera datafile is there
power <- read.csv("household_power_consumption.txt",
sep=";", na.strings="?", stringsAsFactors=FALSE)
power<-power %>% mutate(Date=as.Date(Date,format="%d/%m/%Y"))
power<-power %>% filter(Date>="2007-02-01",Date<="2007-02-02")
power<-power %>% mutate(NewDate=paste(Date,Time))
power$NewDate1=strptime(power$NewDate,format="%Y-%m-%d %H:%M:%S",tz="GMT")
#
# ------------------------------------------------------------------------
# Plot and save chart
png(file = "plot2.png")
plot(x=power$NewDate1,power$Global_active_power,type="l",
     ylab="Global Active Power (kilowatts)",xlab="")
dev.off()
#
# ------------------------------------------------------------------------