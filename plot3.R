data <- read.table('household_power_consumption.txt', header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE)
feb_data <- data[data$Date == '1/2/2007' | data$Date == '2/2/2007', ]

feb_data$DateTime <- strptime(paste(feb_data$Date, feb_data$Time), format = "%d/%m/%Y %H:%M:%S")
plot(feb_data$DateTime, feb_data$Sub_metering_1, type = 'n', xlab = '', ylab = 'Energy sub metering')
lines(feb_data$DateTime, feb_data$Sub_metering_1)
lines(feb_data$DateTime, feb_data$Sub_metering_2, col = 'red')
lines(feb_data$DateTime, feb_data$Sub_metering_3, col = 'blue')
legend("topright", lty = 1, col = c("black","red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.copy(png, file = "plot3.png") 
dev.off()