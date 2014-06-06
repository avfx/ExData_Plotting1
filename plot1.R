data <- read.table('household_power_consumption.txt', header = TRUE, sep = ';',
                   na.strings = '?')
data$Date <- as.Date(data$Date, '%d/%m/%Y')

of_interest <- data[data$Date >= '2007-02-01' & data$Date <= '2007-02-02' &
                        !is.na(data$Date),]

png('plot1.png')
hist(of_interest$Global_active_power, breaks = 12, main = 'Global Active Power',
     xlab = 'Global Active Power (kilowatts)', xlim = c(0, 8), ylim = c(0, 1200),
     xaxt='n', col = 'red')
axis(1, at = c(0, 2, 4, 6))
dev.off()