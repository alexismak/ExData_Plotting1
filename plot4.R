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


#Plot 4

png(file="./plot4.png",
    width=480, height=480)

par(mfrow=c(2,2))

x <- paste(data$Date,data$Time)
x1 <- strptime(x,"%d/%m/%Y %H:%M:%S")

#plot 4.1

plot(x1,data$Global_active_power,type = "l", 
     xlab="",ylab="Global Active Power (kilowatts)")

#plot 4.2

plot(x1,data$Voltage,type = "l",xlab = "datetime", ylab = "Voltage")

#plot 4.3

plot(x1,data$Sub_metering_1,type = "l",  xlab="",ylab="Energy Sub Metering")
lines(x1, data$Sub_metering_2, col="red")
lines(x1, data$Sub_metering_3, col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=1, col = c("black","red","blue"))

#plot 4.4

plot(x1,data$Global_reactive_power,type = "l",
     xlab = "datetime", ylab = "Global_reactive_power")


dev.off()