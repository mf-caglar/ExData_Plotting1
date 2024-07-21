household_data <- read.table("household_power_consumption.txt",sep=";",
                             header = TRUE, na.strings = c("?",""))
library(dplyr)
data <- filter(household_data, Date %in% c("1/2/2007","2/2/2007"))
data$DateTime <- strptime(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")
png(filename = "plot3.png",width = 480, height = 480)
plot(data$DateTime,data$Sub_metering_1, type = "l",col = "black", main = NULL,
     xlab = "", ylab = "Energy sub metering", xaxt = "n")
lines(data$DateTime, data$Sub_metering_2,col = "red")
lines(data$DateTime, data$Sub_metering_3,col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"), lty = 1, lwd = 2)
label_positions <- as.POSIXct(c("2007-02-01 00:00:00", "2007-02-02 00:00:00",
                                "2007-02-03 00:00:00"))
labels <- c("Thu", "Fri", "Sat")
axis(1, at=label_positions, labels=labels)
dev.off()
