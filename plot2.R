### Plot 2

## Download file and check file size
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url, destfile = "data.zip")
unzip("data.zip")
file.size("household_power_consumption.txt")/(1024^2)

## Read data and converting numeric values, dates and times
df<-read.table(file="household_power_consumption.txt",header=T,sep=";")
df$Global_active_power <- as.numeric(df$Global_active_power)
df$Global_reactive_power <- as.numeric(df$Global_reactive_power)
df$Voltage <- as.numeric(df$Voltage)
df$Global_intensity <- as.numeric(df$Global_intensity)
df$Sub_metering_1 <- as.numeric(df$Sub_metering_1)
df$Sub_metering_2 <- as.numeric(df$Sub_metering_2)
df$Sub_metering_3 <- as.numeric(df$Sub_metering_3)
library(lubridate)
df$Date <- dmy(df$Date)
library(dplyr)
df <- df%>% filter(Date >= "2007-02-01", Date <="2007-02-02")
df$DateTime <- ymd_hms(paste(df$Date,df$Time))


## PLOT
png(file="plot2.png")
plot(df$DateTime,df$Global_active_power,type="l",xlab="",
     ylab="Global Active Power (kilowatts)")
dev.off()             
