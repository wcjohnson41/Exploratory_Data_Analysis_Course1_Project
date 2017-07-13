data_complete <- read.csv("household_power_consumption.txt", header = TRUE, sep = ';', na.strings = "?",
                          nrows = 2075259, check.names = FALSE, stringsAsFactors = FALSE, comment.char = "",
                          quote = '\"')
dataSub <- subset(data_complete, Date %in% c("1/2/2007", "2/2/2007"))
dataSub$Date <- as.Date(dataSub$Date, format = "%d/%m/%Y")
hist(dataSub$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "red")

dev.copy(png, file = "plot1.png", height = 480, width = 480)
dev.off()