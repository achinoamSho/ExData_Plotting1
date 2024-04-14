#plot1

data <- read.table('household_power_consumption.txt', header =T, sep = ';', na.strings = '?')

data$Date <- as.Date(data$Date, format="%d/%m/%Y")

data$DateTime <- strptime(paste(data$Date, data$Time), format="%Y-%m-%d %H:%M:%S")

sub1_data <- subset(data, Date == "2007-02-01" | Date == "2007-02-02")

png(filename = 'plot1.png', width = 480, height = 480)
hist(sub1_data$Global_active_power, main = 'Global Active Power', xlab = 'Global Active Power (kilowatts)', col = 'red')
dev.off()
