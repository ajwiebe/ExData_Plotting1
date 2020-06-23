## reading in the data 
full_data <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE, dec = ".")
## subsetting the data 
twodaydata <- subset(full_data, Date %in% c("1/2/2007", "2/2/2007"))
## loading the lubridate library 
library(lubridate)
## converting the data to readable dates and times 
twodaydata$Datetime <- dmy_hms(paste(twodaydata$Date, twodaydata$Time))
## creating relevant variables to plot
GAP <- as.numeric(twodaydata$Global_active_power)
sub1 <- as.numeric(twodaydata$Sub_metering_1)
sub2 <- as.numeric(twodaydata$Sub_metering_2)
sub3 <- as.numeric(twodaydata$Sub_metering_3)
## creating the png file 
png("plot3.png", width = 480, height = 480)
## plotting the variables with the appropriate colours and labels
with(twodaydata, {
  plot(Datetime, sub1, type = "l", ylab = "Energy sub metering", xlab = " ")
  lines(Datetime, sub2, type = "l", col = "red")
  lines(Datetime, sub3, type = "l", col = "blue")
  legend("topright", col = c("Black", "Red", "Blue"), lty = 1, lwd = 2, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
})
## disconnecting 
dev.off()