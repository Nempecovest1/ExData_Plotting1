# Load data
data_orig = read.table("household_power_consumption.txt", header=T, sep=";", na.strings="?")
data_orig$Date = as.Date(data_orig$Date, format="%d/%m/%Y")
data = data_orig[data_orig$Date == "2007-02-01" | data_orig$Date == "2007-02-02",]
rm(data_orig)
data$DateTime = paste(data$Date, data$Time)
data$DateTime = strptime(data$DateTime, format="%Y-%m-%d %H:%M:%S")

# Plot 2
png("plot2.png", width=480, height=480)
plot(data$DateTime, data$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()