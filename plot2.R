
#read data
data<-read.csv("household_power_consumption.txt",header=TRUE,sep=";", colClasses="character")
#make subset
newdata<-data[data$Date=="1/2/2007" | data$Date =="2/2/2007",]
#plot
plot(as.numeric(newdata$Global_active_power),type ="l")
dev.copy(png, file="plot2.png", height=1000, width=1000)
dev.off()




