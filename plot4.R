# Read data
data <- read.csv2("household_power_consumption.txt", na.strings="?", stringsAsFactors=F)
data <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]
data <- transform(data,DateTime=strptime(paste(data$Date,data$Time), "%d/%m/%Y %H:%M:%S"))

# Plot
png(filename="plot4.png", width=480, height=480)
par(mfrow=c(2,2))
with(data, plot(DateTime,Global_active_power,xlab="",ylab="Global Active Power (kilowatts)",type="l"))
with(data, plot(DateTime,Voltage,ylab="Voltage",xlab="datetime",type="l"))
with(data, plot(DateTime,Sub_metering_1,xlab="",ylab="Energy sub metering",type="l"))
with(data, lines(DateTime,Sub_metering_2,col="red"))
with(data, lines(DateTime,Sub_metering_3,col="blue"))
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lwd=1,bty="n")
with(data, plot(DateTime,Global_reactive_power,xlab="datetime",type="l"))
dev.off()
