library(data.table)
inputData <- fread("household_power_consumption.txt")

# Get subset of data
subData <- inputData[Date == "1/2/2007" | Date == "2/2/2007"]

# save histogram
png("plot1.png", width=480, height=480)
hist(as.numeric(subData$Global_active_power), col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")
dev.off
