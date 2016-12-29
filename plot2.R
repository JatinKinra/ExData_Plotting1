# Reading data
data <- read.csv('household_power_consumption.txt',sep = ';')

# Converting date strings to Date object
data$Date <- as.Date(data$Date, "%d/%m/%Y")

minDate <- as.Date("2007-02-01")
maxDate <- as.Date("2007-02-02")

# Subsetting data for "2007-02-01" and "2007-02-02"
finalData <- subset(data, Date >= minDate & Date <= maxDate)

# Plotting graph
png(filename = "plot2.png")
globalActivePower <- as.numeric(as.character(sub("," , ".", finalData$Global_active_power)))
x <- paste(finalData$Date, finalData$Time)
datetime <- strptime(x, "%Y-%m-%d %H:%M:%S")
plot(datetime, globalActivePower, type = "line", ylab = "Global Active Power (kilowatts)")


dev.off()

