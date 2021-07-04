## R script to generate Plot3 ##

library(dplyr)

## Read and Load Data
powerData <- read.csv("household_power_consumption.txt", sep = ";",
                     na.strings = "?", nrows = 207259, stringsAsFactors = FALSE)
febPowerData <- filter(powerData, as.Date(Date) == "01/02/2007" | as.Date(Date) == "02/02/2007")
rm(powerData)

## Process Data
febPowerData$Date <- as.Date(febPowerData$Date, format = "%d/%m/%Y")
datetime <- paste(febPowerData$Date, febPowerData$Time)
febPowerData$Datetime <- as.POSIXct(datetime)

## Plot

with(febPowerData, {
    plot(Sub_metering_1~Datetime, type = "s", xlab = "",
         ylab = "Energy sub metering")
    lines(Sub_metering_2~Datetime, col = 'Red')
    lines(Sub_metering_3~Datetime, col = 'Blue')
})
legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2,
      legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

##Create PNG file

dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()

## End
