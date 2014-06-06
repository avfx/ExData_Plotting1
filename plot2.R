data <- read.table('household_power_consumption.txt', header = TRUE, sep = ';',
                   na.strings = '?')
data$Date <- as.Date(data$Date, format = '%d/%m/%Y')

of_interest <- data[data$Date >= '2007-02-01' & data$Date <= '2007-02-02' &
                        !is.na(data$Date),]
of_interest$Time <- strptime(paste(of_interest$Date, of_interest$Time),
                             format = '%Y-%m-%d %H:%M:%S')

png('plot2.png')
plot(of_interest$Time, of_interest$Global_active_power, type = 'l',
     xlab = '', ylab = 'Global Active Power (kilowatts)')
dev.off()