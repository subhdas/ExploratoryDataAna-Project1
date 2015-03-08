
# read data
data<-read.csv("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?", colClasses="character")
#convert Date column from character to date
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
#select data for the dates
newdata<-data[data$Date=="1/2/2007" | data$Date =="2/2/2007",]


#plots histogram the first plot
hist(as.numeric(newdata$Global_active_power),col="red")

## Saving to file
dev.copy(png, file="plot1.png", height=1000, width=1000)
dev.off()