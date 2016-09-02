# set wd and download data
setwd("~/Training/R/exploratory/week1/project")
fileURL<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
if (!file.exists('./household_power_consumption.zip')){
  download.file(fileURL,'./household_power_consumption.zip', mode = 'wb')
  unzip("household_power_consumption.zip")
}

#read data

house_power <- read.table('./household_power_consumption.txt', header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#subset data

sub_house_power <- house_power[house_power$Date %in% c("1/2/2007","2/2/2007") ,]

#create global active power and date_time based on subset

global_active_power <- as.numeric(sub_house_power$Global_active_power)
date_time <- strptime(paste(sub_house_power$Date, sub_house_power$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#create png

png("plot2.png", width=480, height=480)
plot(date_time, global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
