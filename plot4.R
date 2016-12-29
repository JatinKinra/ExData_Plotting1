# Reading data
data <- read.csv('household_power_consumption.txt',sep = ';')

# Converting date strings to Date object
data$Date <- as.Date(data$Date, "%d/%m/%Y")

minDate <- as.Date("2007-02-01")
maxDate <- as.Date("2007-02-02")

# Subsetting data for "2007-02-01" and "2007-02-02"
finalData <- subset(data, Date >= minDate & Date <= maxDate)

# Plotting graph
png(filename = "plot4.png")
globalActivePower <- as.numeric(as.character(sub("," , ".", finalData$Global_active_power)))
sub_metering_1 <- as.numeric(as.character(sub("," , ".", finalData$Sub_metering_1)))
sub_metering_2 <- as.numeric(as.character(sub("," , ".", finalData$Sub_metering_2)))
sub_metering_3 <- as.numeric(as.character(sub("," , ".", finalData$Sub_metering_3)))
voltage <- as.numeric(as.character(sub("," , ".", finalData$Voltage)))
globalReactivePower <- as.numeric(as.character(sub("," , ".", finalData$Global_reactive_power)))

x <- paste(finalData$Date, finalData$Time)
datetime <- strptime(x, "%Y-%m-%d %H:%M:%S")

par(mfcol = c(2,2))

# Graph 1
plot(datetime, globalActivePower, type = "line", ylab = "Global Active Power (kilowatts)")

# Graph 2
plot(datetime, sub_metering_1, type = "line", ylab = "Energy sub metering")
lines(datetime, sub_metering_2, type = "o", col = "red")
lines(datetime, sub_metering_3, type = "o", col = "blue")

# Graph 3
plot(datetime, voltage, type = "line")

# Graph 4
plot(datetime, globalReactivePower, type = "line")

dev.off()
