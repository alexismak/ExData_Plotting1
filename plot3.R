#read the data
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
zipFile <- "./household_power_consumption.zip"
textFile <- "./household_power_consumption.txt"

if(!file.exists(textFile)){
  download.file(url,zipFile)
  unzip(zipFile, overwrite = TRUE, exdir = ".")
}

fullData <- read.table(textFile, header = TRUE, sep = ";", na.strings = "?")
data <- fullData[fullData$Date=="1/2/2007"|fullData$Date=="2/2/2007",]


#Plot 3

png(file="./plot3.png",
    width=480, height=480)

x <- paste(data$Date,data$Time)
x1 <- strptime(x,"%d/%m/%Y %H:%M:%S")

plot(x1,data$Sub_metering_1,type = "l",  xlab="",ylab="Energy Sub Metering")
lines(x1, data$Sub_metering_2, col="red")
lines(x1, data$Sub_metering_3, col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=1, col = c("black","red","blue"))

dev.off()