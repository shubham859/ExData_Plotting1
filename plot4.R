data <- read.table("household_power_consumption.txt",
                   header = TRUE, sep = ";")
dataset <- data[(data$Date == "1/2/2007") | (data$Date == "2/2/2007"), ]

date_time <- paste(dataset$Date, dataset$Time, sep = " ")
date_time <- strptime(date_time, "%d/%m/%Y %H:%M:%S")

gap <- as.numeric(dataset$Global_active_power)
grap <- as.numeric(dataset$Global_reactive_power)
v <- as.numeric(dataset$Voltage)

sub1 <- as.numeric(dataset$Sub_metering_1)
sub2 <- as.numeric(dataset$Sub_metering_2)
sub3 <- as.numeric(dataset$Sub_metering_3)

png("plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2)) 

plot(date_time, gap, type = "l", xlab = "",
     ylab = "Global Active Power",)

plot(date_time, v, type = "l", xlab = "datetime", ylab = "Voltage")

plot(date_time, sub1, type = "l", ylab = "Energy Submetering", xlab = "")
lines(date_time, sub2, type = "l", col = "red")
lines(date_time, sub3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty = 1, lwd = 2.5, col=c("black", "red", "blue"))

plot(date_time, grap, type = "l",
     xlab = "datetime", ylab = "Global_reactive_power")

dev.off()
