
filename <- "exdata%2Fdata%2Fhousehold_power_consumption.zip"
##download and unzip the dataset:
if (!file.exists(filename)){
  fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip "
  download.file(fileURL, filename, method="curl")
}  
if (!file.exists("household_power_consumption.txt")) { 
  unzip(filename) 
}

mydata<- read.table("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                    nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
datetime <- paste(mydata$Date, mydata$Time)
mydata$datetime <- dmy_hms(datetime)
mydata$Date <- dmy(mydata$Date)
mydata2 <- mydata[mydata$Date == "2007-02-01" | mydata$Date == "2007-02-02" , ]


png("plot4.png")
par(mfrow = c(2,2))
with(mydata2,plot(y = mydata2$Global_active_power, x = mydata2$datetime, type="l",ylab="Global Active Power (kilowatts)", xlab=""))
with(mydata2,plot(y = mydata2$Voltage, x = mydata2$datetime, type="l",ylab="Voltage", xlab="datetime"))
with(mydata2,plot(y = mydata2$Sub_metering_1, x = mydata2$datetime,ylab = "Energie sub metering",xlab = "", type = "n"))
with(mydata2,lines(y = mydata2$Sub_metering_1, x = mydata2$datetime, type="l", col ='black'))
with(mydata2,lines(y = mydata2$Sub_metering_2, x = mydata2$datetime, type="l", col ='red'))
with(mydata2,lines(y = mydata2$Sub_metering_3, x = mydata2$datetime, type="l", col ='blue'))
legend("topright", lwd=c(2.5,2.5,2.5) ,col = c("black","red","blue"), legend = c("Submetering_1","Submetering_2","Submetering_3"))
with(mydata2,plot(y = mydata2$Global_reactive_power, x = mydata2$datetime, type="l",ylab="Global_reactive_power", xlab="datetime"))
dev.off()



with(mydata2,plot(y = mydata2$Sub_metering_1, x = mydata2$datetime,ylab = "Energie sub metering",xlab = "", type = "n"))
with(mydata2,lines(y = mydata2$Sub_metering_1, x = mydata2$datetime, type="l", col ='black'))
with(mydata2,lines(y = mydata2$Sub_metering_2, x = mydata2$datetime, type="l", col ='red'))
with(mydata2,lines(y = mydata2$Sub_metering_3, x = mydata2$datetime, type="l", col ='blue'))
legend("topright", lwd=c(2.5,2.5,2.5) ,col = c("black","red","blue"), legend = c("Submetering_1","Submetering_2","Submetering_3"))
dev.off()