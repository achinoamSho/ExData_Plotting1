#plot4

data <- read.table('household_power_consumption.txt', header =T, sep = ';', na.strings = '?')

data$Date <- as.Date(data$Date, format="%d/%m/%Y")

data$DateTime <- strptime(paste(data$Date, data$Time), format="%Y-%m-%d %H:%M:%S")

sub4_data <- subset(data, Date == "2007-02-01" | Date == "2007-02-02")

png(filename = 'plot4.png', width = 480, height = 480)
par(mfrow = c(2, 2))
plot(sub4_data$DateTime, sub4_data$Global_active_power, type = "l", xlab = '',ylab = 'Global Active Power (kilowatts)')
plot(sub4_data$DateTime, sub4_data$Voltage, type = 'l', xlab = 'DateTime', ylab = 'Voltage')
plot(sub4_data$DateTime, sub4_data$Sub_metering_1, type = 'l', xlab = '', ylab = 'Energy sub metering')
lines(sub4_data$DateTime, sub4_data$Sub_metering_2, col = 'red')
lines(sub4_data$DateTime, sub4_data$Sub_metering_3, col = 'blue')
legend('topright', legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), 
       col = c('black', 'red', 'blue'), lty = 1, cex = 0.8)
plot(sub4_data$DateTime, sub4_data$Global_reactive_power, type = 'l', xlab = 'DateTime', ylab = 'Global_reactive_power')
dev.off()
