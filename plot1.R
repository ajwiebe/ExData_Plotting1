## reading in the data
full_data <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
## subsetting the data 
twodaydata <- subset(full_data, Date %in% c("1/2/2007", "2/2/2007"))
## creating the png file
png("plot1.png", width = 480, height = 480)
## creating the histogram with appropriate colours and labels
hist(twodaydata$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
## disconnecting 
dev.off()
