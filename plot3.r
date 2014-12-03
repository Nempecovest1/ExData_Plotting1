# Load data
data_orig = read.table("household_power_consumption.txt", header=T, sep=";", na.strings="?")
data_orig$Date = as.Date(data_orig$Date, format="%d/%m/%Y")
data = data_orig[data_orig$Date == "2007-02-01" | data_orig$Date == "2007-02-02",]
rm(data_orig)
data$DateTime = paste(data$Date, data$Time)
data$DateTime = strptime(data$DateTime, format="%Y-%m-%d %H:%M:%S")

# Plot 3
png("plot3.png", width=480, height=480)
with(data, {
	plot(DateTime, Sub_metering_1, type="l", col="black", ylab="Energy sub metering", xlab="")
	points(DateTime, Sub_metering_2, type="l", col="red")
	points(DateTime, Sub_metering_3, type="l", col="blue")
	legend(x="topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
	col=c("black","red", "blue"), lty=1)
})
dev.off()