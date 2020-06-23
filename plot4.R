## reading in the data
full_data <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE, dec = ".")
## subsetting the data 
twodaydata <- subset(full_data, Date %in% c("1/2/2007", "2/2/2007"))
## loading the lubridate library 
library(lubridate)
## converting the data to readable dates and times
twodaydata$Datetime <- dmy_hms(paste(twodaydata$Date, twodaydata$Time))
## creating the png file 
png("plot4.png", width = 480, height = 480)
## creating the appropriate dimensions 
par(mfcol = c(2, 2))
par(mar = c(4, 4, 3, 2))
## creating the data table for relevant variables with the appropriate labels and colours
with(twodaydata, {
  plot(twodaydata$Datetime, twodaydata$Global_active_power, type = "l", ylab = "Global Active Power", xlab = " ")
  plot(twodaydata$Datetime, twodaydata$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = " ")
  lines(twodaydata$Datetime, twodaydata$Sub_metering_2, type = "l", col = "Red")
  lines(twodaydata$Datetime, twodaydata$Sub_metering_3, type = "l", col = "Blue")
  legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = c(1, 1, 1), bty = "n")
  
  plot(twodaydata$Datetime, twodaydata$Voltage, type = "l", ylab = "Voltage", xlab = "datetime")
  plot(twodaydata$Datetime, twodaydata$Global_reactive_power, type = "l", ylab = "Global_reactive_power", xlab = "datetime") }
)
## disconnecting 
dev.off()
