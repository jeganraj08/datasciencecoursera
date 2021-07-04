## R script to generate Plot2 ##

setwd("desktop/coursera")
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
plot(febPowerData$Global_active_power~febPowerData$Datetime, type= "s", xlab = "",
      ylab = "Global Active Power (kilowatts)")

##Create PNG file

dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()

## End
