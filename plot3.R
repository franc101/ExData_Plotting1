# Read data
data <- read.csv2("household_power_consumption.txt", na.strings="?", stringsAsFactors=F)
data <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]
data <- transform(data,DateTime=strptime(paste(data$Date,data$Time), "%d/%m/%Y %H:%M:%S"))

# Plot
png(filename="plot3.png", width=480, height=480)
plot(data=data, Sub_metering_1 ~ DateTime, type="n", ylab = "Energy sub metering", xlab=NA)
points(data=data, Sub_metering_1 ~ DateTime, type="l", col="black")
points(data=data, Sub_metering_2 ~ DateTime, type="l", col="red")
points(data=data, Sub_metering_3 ~ DateTime, type="l", col="blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black", "red", "blue"), lwd=1, lty=c(1,1,1))
dev.off()
