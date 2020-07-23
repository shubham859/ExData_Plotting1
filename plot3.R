data <- read.table("household_power_consumption.txt",
                   header = TRUE, sep = ";")
dataset <- data[(data$Date == "1/2/2007") | (data$Date == "2/2/2007"), ]

date_time <- paste(dataset$Date, dataset$Time, sep = " ")
date_time <- strptime(date_time, "%d/%m/%Y %H:%M:%S")

sub1 <- as.numeric(dataset$Sub_metering_1)
sub2 <- as.numeric(dataset$Sub_metering_2)
sub3 <- as.numeric(dataset$Sub_metering_3)

png("plot3.png", width = 480, height = 480)

plot(date_time, sub1, type = "l", xlab = "",
     ylab = "Energy Submetering")
lines(date_time, sub2, type = "l", col = "red")
lines(date_time, sub3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty = 1, lwd = 3, col = c("black", "red", "blue"))

dev.off()