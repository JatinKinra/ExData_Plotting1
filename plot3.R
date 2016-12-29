# Reading data
data <- read.csv('household_power_consumption.txt',sep = ';')

# Converting date strings to Date object
data$Date <- as.Date(data$Date, "%d/%m/%Y")

minDate <- as.Date("2007-02-01")
maxDate <- as.Date("2007-02-02")

# Subsetting data for "2007-02-01" and "2007-02-02"
finalData <- subset(data, Date >= minDate & Date <= maxDate)

# Plotting graph
png(filename = "plot3.png")
sub_metering_1 <- as.numeric(as.character(sub("," , ".", finalData$Sub_metering_1)))
sub_metering_2 <- as.numeric(as.character(sub("," , ".", finalData$Sub_metering_2)))
sub_metering_3 <- as.numeric(as.character(sub("," , ".", finalData$Sub_metering_3)))
x <- paste(finalData$Date, finalData$Time)
datetime <- strptime(x, "%Y-%m-%d %H:%M:%S")

plot(datetime, sub_metering_1, type = "line", ylab = "Energy sub metering")
lines(datetime, sub_metering_2, type = "o", col = "red")
lines(datetime, sub_metering_3, type = "o", col = "blue")

legend("topright", lwd = 2, col = c("black","red","blue"), legend = c("sub_metering_1","sub_metering_2","sub_metering_3"))

dev.off()



