## R script to generate Plot4 ##

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

par(mfrow = c(2,2), mar = c(4,4,2,1), oma = c(0,0,2,0))

with(febPowerData,
{
    plot(Global_active_power~Datetime, type = "s", xlab = "",
         ylab = "Global Active Power")

    plot(Voltage~Datetime, type="s", xlab = "datetime",
         ylab = "Voltage")

    plot(Sub_metering_1~Datetime, type = "s", xlab = "",
        ylab = "Energy sub metering")

    lines(Sub_metering_2~Datetime, col = 'Red')
    lines(Sub_metering_3~Datetime, col = 'Blue')
    legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2,
    legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

    plot(Global_reactive_power~Datetime, type = "s", xlab = "datetime",
         ylab = "Global_reactive_power")
}
)


##Create PNG file

dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()

## End
