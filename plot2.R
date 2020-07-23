data <- read.table("household_power_consumption.txt",
                   header = TRUE, sep = ";")
dataset <- data[(data$Date == "1/2/2007") | (data$Date == "2/2/2007"), ]

date_time <- paste(dataset$Date, dataset$Time, sep = " ")
date_time <- strptime(date_time, "%d/%m/%Y %H:%M:%S")

gap <- as.numeric(dataset$Global_active_power)

png("plot2.png", width = 480, height = 480)
plot(date_time, gap, type = "l", xlab = "",
     ylab = "Global Active Power (kilowatts)")

dev.off()