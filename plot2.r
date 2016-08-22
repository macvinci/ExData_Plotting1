
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


png("plot2.png")
with(mydata2,plot(y = mydata2$Global_active_power, x = mydata2$datetime, type="l",ylab="Global Active Power (kilowatts)", xlab=""))
dev.off()