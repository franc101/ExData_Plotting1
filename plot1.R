# Read data
data <- read.csv2("household_power_consumption.txt", na.strings="?", stringsAsFactors=F)
data <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]

# Plot
png(filename="plot1.png", width=480, height=480)
hist(as.numeric(data$Global_active_power), main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)", col="red")
dev.off()
