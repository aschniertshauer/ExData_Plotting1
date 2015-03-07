# ------------------------------------------------------------------------
#
# Cousera "Exploratory Data Analysis"
# Project 1 - Plot 1
#
# ------------------------------------------------------------------------
#
# Load packages used
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
#
# ------------------------------------------------------------------------
# Plot and save chart
png(file = "plot1.png")
hist(power$Global_active_power,col="red",main="Global Active Power",
     xlab="Global Active Power (kilowatts)")
dev.off()
#
# ------------------------------------------------------------------------