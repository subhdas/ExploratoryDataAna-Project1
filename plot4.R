#read data
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
newData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#make subsets
datetime <- strptime(paste(newData$Date, newData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(newData$Global_active_power)
globalReactivePower <- as.numeric(newData$Global_reactive_power)
voltage <- as.numeric(subSetData$Voltage)
subMetering1 <- as.numeric(newData$Sub_metering_1)
subMetering2 <- as.numeric(newData$Sub_metering_2)
subMetering3 <- as.numeric(newData$Sub_metering_3)

# make pngs
png("plot4.png", width=1000, height=1000)
par(mfrow = c(2, 2)) 
#plot 1
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)
#plot 2
plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")
#plot 3
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")
#plot 4
plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()