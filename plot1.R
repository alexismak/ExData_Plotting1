#read the data
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
zipFile <- "./household_power_consumption.zip"
textFile <- "./household_power_consumption.txt"

if(!file.exists(textFile)){
  download.file(url,zipFile)
  unzip(zipFile, overwrite = TRUE, exdir = ".")
}

fullData <- read.table(textFile, header = TRUE, sep = ";",  na.strings = "?")
data <- fullData[fullData$Date=="1/2/2007"|fullData$Date=="2/2/2007",]


#Plot 1

png(file="./plot1.png",
    width=480, height=480)

data$Global_active_power <- as.numeric(data$Global_active_power)

hist(data$Global_active_power, col='red',main="Global Active Power",
     xlab = "Global Active Power (kilowatts)")

dev.off()