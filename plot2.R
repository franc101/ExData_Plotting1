# Read data
data <- read.csv2("household_power_consumption.txt", na.strings="?", stringsAsFactors=F)
data <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]
data <- transform(data,DateTime=strptime(paste(data$Date,data$Time), "%d/%m/%Y %H:%M:%S"))

# Plot
png(filename="plot2.png", width=480, height=480)
with(data, plot(DateTime, Global_active_power, xlab="", ylab="Global Active Power (kilowatts)", type="l"))
dev.off()
