## reading in the data
full_data <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE)
## subsetting the data 
twodaydata <- subset(full_data, Date %in% c("1/2/2007", "2/2/2007"))
## converting the data to readable dates and times
twodaydata$Date <- as.Date(twodaydata$Date, "%d%m%Y")
datetimedata <- paste(as.Date(twodaydata$Date), twodaydata$Time)
twodaydata$Datetime <- as.POSIXct(datetimedata)
## creating the png file
png("plot2.png", width=480, height=480)
## creating the graph with appropriate labels
with(twodaydata, { plot(globalActivePower~Datetime, type="l", ylab = "Global Active Power (kilowatts)", xlab = " ")})
## disconnecting 
dev.off()