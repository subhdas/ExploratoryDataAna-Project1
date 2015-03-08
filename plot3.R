# read data
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
newData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#subset data
datetime <- strptime(paste(newData$Date, newData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(newData$Global_active_power)
subMetering1 <- as.numeric(newData$Sub_metering_1)
subMetering2 <- as.numeric(newData$Sub_metering_2)
subMetering3 <- as.numeric(newData$Sub_metering_3)

# plot data
png("plot3.png", width=1000, height=1000)
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")

#make lines
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")

# add legend
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()