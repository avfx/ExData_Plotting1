data <- read.table('household_power_consumption.txt', header = TRUE, sep = ';',
                   na.strings = '?')
data$Date <- as.Date(data$Date, format = '%d/%m/%Y')

of_interest <- data[data$Date >= '2007-02-01' & data$Date <= '2007-02-02' &
                        !is.na(data$Date),]
of_interest$Time <- strptime(paste(of_interest$Date, of_interest$Time),
                             format = '%Y-%m-%d %H:%M:%S')

png('plot4.png')
par(mfrow = c(2, 2), mar = c(5, 4, 2, 2))
plot(of_interest$Time, of_interest$Global_active_power, type = 'l',
     xlab = '', ylab = 'Global Active Power')

plot(of_interest$Time, of_interest$Voltage, type = 'l',
     xlab = 'datetime', ylab = 'Voltage')

plot(of_interest$Time, of_interest$Sub_metering_1, type = 'l', col = 'black',
     xlab = '', ylab = 'Energy sub metering')
lines(of_interest$Time, of_interest$Sub_metering_2, type = 'l', col = 'red')
lines(of_interest$Time, of_interest$Sub_metering_3, type = 'l', col = 'blue')
legend('topright', names(of_interest)[7:9], lty = 1, bty = 'n',
       col = c('black','red','blue'))

plot(of_interest$Time, of_interest$Global_reactive_power, type = 'l',
     xlab = 'datetime', ylab = 'Global_reactive_power')

dev.off()