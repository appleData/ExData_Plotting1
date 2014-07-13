########################################
# Exploratory Data Analysis - Project 1
#
# Instructions for running
# 1. Download data file - 'household_power_consumption.txt' to  folder 'C:\Users\home\Downloads/'
# 2. setwd("C:/Users/home/Downloads/")
# 3. source("plot1.R")
########################################

# Clean upWorkspace
rm(list=ls())

# Load data
path <- "household_power_consumption.txt"
myData <- read.table(path,header=TRUE,sep=";",colClasses="character")

# Convert to Date/Time 
myData[,1] <- as.Date(myData$Date,"%d/%m/%Y")
myData[,2] <- as.Date(myData$Time,"%H/%M/%S")

# Create a subset of the data between 2007-02-01 and 2007-02-02
subData <- subset(myData, myData$Date %in% as.Date(c("2007-02-01","2007-02-02")))

# Cast columns as numeric
subData[,3] <- as.numeric(subData[,3])
subData[,4] <- as.numeric(subData[,4])
subData[,5] <- as.numeric(subData[,5])
subData[,6] <- as.numeric(subData[,6])
subData[,7] <- as.numeric(subData[,7])
subData[,8] <- as.numeric(subData[,8])
subData[,9] <- as.numeric(subData[,9])

# Create  the Plot
hist(subData[,3], col = "Red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

# Copy PNG file 
dev.copy(png,file="plot1.png")

# Close device
dev.off()