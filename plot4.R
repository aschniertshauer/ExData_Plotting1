# ------------------------------------------------------------------------
#
# Cousera "Exploratory Data Analysis"
# Project 1 - Plot 4
#
# ------------------------------------------------------------------------
#
# Set system locale and load required packages
Sys.setlocale("LC_TIME", "C")
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
png(file = "plot4.png")
par(mfrow=c(2,2))
plot(x=power$NewDate1,y=power$Global_active_power,type="l",
     ylab="Global Active Power",xlab="")
plot(x=power$NewDate1,y=power$Voltage,type="l",
     ylab="Voltage",xlab="datetime")
plot(x=power$NewDate1,y=power$Sub_metering_1,type="l",
ylab="Energy sub metering",xlab="")
points(x=power$NewDate1,y=power$Sub_metering_2,col="red",type="l")
points(x=power$NewDate1,y=power$Sub_metering_3,col="blue",type="l")
legend("topright", lty=1, bty="n",col = c("black","red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
plot(x=power$NewDate1,y=power$Global_reactive_power,type="l",
     ylab="Global_reactive_power",xlab="datetime")
dev.off()
#
# ------------------------------------------------------------------------