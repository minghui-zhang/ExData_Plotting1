data <- read.table('household_power_consumption.txt', header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE)
feb_data <- data[data$Date == '1/2/2007' | data$Date == '2/2/2007', ]

feb_data$DateTime <- strptime(paste(feb_data$Date, feb_data$Time), format = "%d/%m/%Y %H:%M:%S")

par(mfrow = c(2,2), oma = c(0,0,0,0))
plot(feb_data$DateTime, feb_data$Global_active_power, type = 'n', xlab = '', ylab = 'Global Active Power (kilowatts)')
lines(feb_data$DateTime, feb_data$Global_active_power)

plot(feb_data$DateTime, feb_data$Voltage, type = 'n', xlab = 'datetime', ylab = 'Voltage')
lines(feb_data$DateTime, feb_data$Voltage)

plot(feb_data$DateTime, feb_data$Sub_metering_1, type = 'n', xlab = '', ylab = 'Energy sub metering')
lines(feb_data$DateTime, feb_data$Sub_metering_1)
lines(feb_data$DateTime, feb_data$Sub_metering_2, col = 'red')
lines(feb_data$DateTime, feb_data$Sub_metering_3, col = 'blue')
legend("topright", lty = 1, bty = 'n', col = c("black","red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(feb_data$DateTime, feb_data$Global_reactive_power, type = 'n', xlab = 'datetime', ylab = 'Global_reactive_power')
lines(feb_data$DateTime, feb_data$Global_reactive_power)

dev.copy(png, file = "plot4.png") 
dev.off()