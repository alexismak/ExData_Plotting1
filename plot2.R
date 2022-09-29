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


#Plot 2

png(file="./plot2.png",
    width=480, height=480)

x <- paste(data$Date,data$Time)
x1 <- strptime(x,"%d/%m/%Y %H:%M:%S")

plot(x1,data$Global_active_power,type = "l", 
     xlab="",ylab="Global Active Power (kilowatts)")

dev.off()