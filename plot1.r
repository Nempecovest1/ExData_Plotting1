# Load data
data_orig = read.table("household_power_consumption.txt", header=T, sep=";", na.strings="?")
data_orig$Date = as.Date(data_orig$Date, format="%d/%m/%Y")
data = data_orig[data_orig$Date == "2007-02-01" | data_orig$Date == "2007-02-02",]
rm(data_orig)
data$DateTime = paste(data$Date, data$Time)
data$DateTime = strptime(data$DateTime, format="%Y-%m-%d %H:%M:%S")

# Plot 1
png("plot1.png", width=480, height=480)
hist(data$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")
dev.off()