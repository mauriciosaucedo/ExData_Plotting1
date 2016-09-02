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

#create sub metering 1, 2, 3 and date_time based on subset

sub_metering_1 <- as.numeric(sub_house_power$Sub_metering_1)
sub_metering_2 <- as.numeric(sub_house_power$Sub_metering_2)
sub_metering_3 <- as.numeric(sub_house_power$Sub_metering_3)
date_time <- strptime(paste(sub_house_power$Date, sub_house_power$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#create png

png("plot3.png", width=480, height=480)
plot(date_time, sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(date_time, sub_metering_2, type="l", col="red")
lines(date_time, sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()