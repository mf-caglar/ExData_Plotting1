household_data <- read.table("household_power_consumption.txt",sep=";",header = TRUE, na.strings = c("?",""))
library(dplyr)
data <- filter(household_data, Date %in% c("1/2/2007","2/2/2007"))
sum(is.na(data)) # no null values
data$DateTime <- paste(data$Date,data$Time)
library(lubridate)
data$DateTime <- dmy_hms(data$DateTime)
png(filename = "plot1.png",width = 480, height = 480)
hist(data$Global_active_power,col="red", main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
dev.off()
