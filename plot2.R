household_data <- read.table("household_power_consumption.txt",sep=";",
                             header = TRUE, na.strings = c("?",""))
library(dplyr)
data <- filter(household_data, Date %in% c("1/2/2007","2/2/2007"))
data$DateTime <- strptime(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")
png(filename = "plot2.png",width = 480, height = 480)
plot(data$DateTime, data$Global_active_power, type="l", xlab="",
     ylab="Global Active Power (kilowatts)", xaxt="n")
label_positions <- as.POSIXct(c("2007-02-01 00:00:00", "2007-02-02 00:00:00",
                                "2007-02-03 00:00:00"))
labels <- c("Thu", "Fri", "Sat")
axis(1, at=label_positions, labels=labels)
dev.off()
