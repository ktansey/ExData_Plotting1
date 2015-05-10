
data <- read.table("./data/household_power_consumption.txt", h=TRUE, sep=";", 
                   na.strings = "?")
subset_data <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

## make bar plot
png("plot1.png", width=480, height=480)
hist(subset_data$Global_active_power, col="red", main="Global Active Power", 
     xlab="Global Active Power (kilowatts)")
dev.off()
