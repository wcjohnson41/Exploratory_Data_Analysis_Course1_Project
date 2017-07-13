data_complete <- read.csv("household_power_consumption.txt", header = TRUE, sep = ';', na.strings = "?",
                          nrows = 2075259, check.names = FALSE, stringsAsFactors = FALSE, comment.char = "",
                          quote = '\"')
dataSub <- subset(data_complete, Date %in% c("1/2/2007", "2/2/2007"))
dataSub$Date <- as.Date(dataSub$Date, format = "%d / %m / %Y")
datetime <- paste(as.Date(dataSub$Date), dataSub$Time)
dataSub$Datetime <- as.POSIXct(datetime)

with(dataSub, {
  plot(Sub_metering_1~Datetime, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
  lines(Sub_metering_2~Datetime, col = 'Red')
  lines(Sub_metering_3~Datetime, col = 'Blue')
})

legend("topright", col = c("black", "red", "blue"), lty = 1,lwd = 2,
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.copy(png, file = "plot3.png", height = 480, width = 480)
dev.off()