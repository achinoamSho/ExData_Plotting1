#plot3

data <- read.table('household_power_consumption.txt', header =T, sep = ';', na.strings = '?')

data$Date <- as.Date(data$Date, format="%d/%m/%Y")

data$DateTime <- strptime(paste(data$Date, data$Time), format="%Y-%m-%d %H:%M:%S")

sub3_data <- subset(data, Date == "2007-02-01" | Date == "2007-02-02")

png(filename = "plot3.png", width = 480, height = 480)
plot(sub3_data$DateTime, sub3_data$Sub_metering_1, type = 'l', xlab = '', ylab = 'Energy sub metering')
lines(sub3_data$DateTime, sub3_data$Sub_metering_2, col = 'red')
lines(sub3_data$DateTime, sub3_data$Sub_metering_3, col = 'blue')
legend('topright', legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), 
       col = c('black', 'red', 'blue'), lty = 1, cex = 0.8)
dev.off()
