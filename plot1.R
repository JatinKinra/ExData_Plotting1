# Reading data
data <- read.csv('household_power_consumption.txt',sep = ';')

# Converting date strings to Date object
data$Date <- as.Date(data$Date, "%d/%m/%Y")

minDate <- as.Date("2007-02-01")
maxDate <- as.Date("2007-02-02")

# Subsetting data for "2007-02-01" and "2007-02-02"
finalData <- subset(data, Date >= minDate & Date <= maxDate)

# Plotting graph
png(filename = "plot1.png")
globalActivePower <- as.numeric(as.character(sub("," , ".", finalData$Global_active_power)))
hist(globalActivePower, xlab = "Global Active Power (kilowatts)", 
     col = "red", main = "Global Active Power", ylim=c(0,1200))
dev.off()

