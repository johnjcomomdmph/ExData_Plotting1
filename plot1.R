## SET WORKING DIRECTORY - MAKE SURE IT IS THE SAME AS "getwd()" in R 
setwd("C:/Users/user/Dropbox/Education/Coursera/JH Data Science/EXPLORATORY DATA ANALYSIS/COURSE PROJECT 1/")
## DOWNLOAD PROJECT DATA FOUND ON COURSE WEBSITE:
##     https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip.zip
##      (or click link found on course website)
## THIS WILL PUT "exdata_data_household_power_consumption" in Downloads.
## YOU WILL BE PROMTED TO BROWSE - BROWSE TO THE WORKING DIRECTORY
## UNZIP THE COMPRESSED ZIP FILE (or "EXTRACT ALL").
## FILES WILL BE EXTRACTED TO THE WORKING DIRECTORY:
##      A text document NAMED "household_power_consumption" SHOULD BE IN THE WORKING DIRECTORY

##  PLOT 1

## dev.new()
data<-read.table("household_power_consumption.txt", header= TRUE, sep=";")

data2days<-subset(data, (Date=="1/2/2007")|(Date=="2/2/2007"))
data2days$Global_active_power<-as.numeric(as.character(data2days$Global_active_power))
data2days$Day<-weekdays(as.Date(data2days$Date))
data2days$Datetime<-as.POSIXct(paste(data2days$Date, data2days$Time))

##  png(filename="plot1.png", width=480, height=480)
with(data2days, hist(Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red"))

##  dev.off()