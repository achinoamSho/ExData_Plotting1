#plot2

data <- read.table('household_power_consumption.txt', header =T, sep = ';', na.strings = '?')

data$Date <- as.Date(data$Date, format="%d/%m/%Y")

data$DateTime <- strptime(paste(data$Date, data$Time), format="%Y-%m-%d %H:%M:%S")

sub2_data <- subset(data, Date == "2007-02-01" | Date == "2007-02-02")

png(filename = 'plot2.png', width = 480, height = 480)
plot(sub2_data$DateTime, sub2_data$Global_active_power, type = "l", xlab = '', ylab = 'Global Active Power (kilowatts)')
dev.off()
