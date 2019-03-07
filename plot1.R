#data <- read.table('household_power_consumption.txt', header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE)
feb_data <- data[data$Date == '1/2/2007' | data$Date == '2/2/2007', ]

feb_data$DateTime <- strptime(paste(feb_data$Date, feb_data$Time), format = "%d/%m/%Y %H:%M:%S")

hist(feb_data$Global_active_power, col = 'red', main = 'Global Active Power', xlab = 'Global Active Power (kilowatts)')
dev.copy(png, file = "plot1.png") 
dev.off()