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
mydata$Time = hms(mydata$Time)
mydata$Date = dmy(mydata$Date)
mydata2 <- mydata[mydata$Date == "2007-02-01" | mydata$Date == "2007-02-02" , ]

png("plot1.png")
with(data = mydata2,hist(as.numeric(Global_active_power),main = "Global Active Power", col = "red",xlab = "Global Active Power (kilowatts)", breaks = 20))
dev.off()
