library(data.table)
inputData <- fread("household_power_consumption.txt")

# Get subset of data
subData <- inputData[Date == "1/2/2007" | Date == "2/2/2007"]
x <- as.POSIXct(paste(subData$Date, subData$Time), format="%d/%m/%Y %H:%M:%S")
y <- as.numeric(subData$Global_active_power)

# save plot
png("plot2.png", width=480, height=480)
plot(x, y, pch =".", xlab="", ylab="Global Active Power (killowats)" )
lines(x, y)

dev.off
