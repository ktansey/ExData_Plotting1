
data <- read.table("./data/household_power_consumption.txt", h=TRUE, sep=";", 
                   na.strings = "?")
subset_data <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

datetime <- strptime(paste(subset_data$Date, subset_data$Time, sep=" "), 
                     "%d/%m/%Y %H:%M:%S") 

## make plot

png("plot4.png", width=480, height=480)

par(mfrow = c(2, 2))

plot(datetime, subset_data$Global_active_power, 
     ylab="Global Active Power", xlab="", type="l")

plot(datetime, subset_data$Voltage, 
     ylab="Voltage", xlab="datetime", type="l")


plot(datetime, subset_data$Sub_metering_1, type="l", ylab="Energy sub metering", 
     xlab="")
lines(datetime, subset_data$Sub_metering_2, type="l", col="red")
lines(datetime, subset_data$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=1, lwd=2.5, col=c("black", "red", "blue"), bty = "n")

plot(datetime, subset_data$Global_reactive_power, 
     ylab="Global_reactive_power", xlab="datetime", type="l")

dev.off()

