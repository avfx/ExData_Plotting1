data <- read.table('household_power_consumption.txt', header = TRUE, sep = ';',
                   na.strings = '?')
data$Date <- as.Date(data$Date, format = '%d/%m/%Y')

of_interest <- data[data$Date >= '2007-02-01' & data$Date <= '2007-02-02' &
                        !is.na(data$Date),]
of_interest$Time <- strptime(paste(of_interest$Date, of_interest$Time),
                             format = '%Y-%m-%d %H:%M:%S')

png('plot3.png')
plot(of_interest$Time, of_interest$Sub_metering_1, type = 'l', col = 'black',
     xlab = '', ylab = 'Energy sub metering')
lines(of_interest$Time, of_interest$Sub_metering_2, type = 'l', col = 'red')
lines(of_interest$Time, of_interest$Sub_metering_3, type = 'l', col = 'blue')

legend('topright', names(of_interest)[7:9], lty = 1, col = c('black','red','blue'))
dev.off()