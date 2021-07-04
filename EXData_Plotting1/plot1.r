## R script to generate Plot1 ##

setwd("desktop/coursera")
library(dplyr)

## Read and Load Data
powerData <- read.csv("household_power_consumption.txt", sep = ";",
                     na.strings = "?", nrows = 207259, stringsAsFactors = FALSE)
febPowerData <- filter(powerData, as.Date(Date) == "01/02/2007" | as.Date(Date) == "02/02/2007")
rm(powerData)

##Plot the Histogram
hist(febPowerData$Global_active_power, main = "Global Active Power", xlab = "Global Active Power(kilowatts)",
    ylab = "Frequency", col="red")

##Create PNG file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()

## End
