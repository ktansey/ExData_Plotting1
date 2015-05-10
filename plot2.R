
data <- read.table("./data/household_power_consumption.txt", h=TRUE, sep=";", 
                   na.strings = "?")
subset_data <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

datetime <- strptime(paste(subset_data$Date, subset_data$Time, sep=" "), 
                     "%d/%m/%Y %H:%M:%S") 

## make plot
png("plot2.png", width=480, height=480)
plot(datetime, subset_data$Global_active_power, 
     ylab="Global Active Power (kilowatts)", xlab="", type="l")
dev.off()

