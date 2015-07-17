library(data.table)
inputData <- fread("household_power_consumption.txt")

# Get subset of data
subData <- inputData[Date == "1/2/2007" | Date == "2/2/2007"]
x <- as.POSIXct(paste(subData$Date, subData$Time), format="%d/%m/%Y %H:%M:%S")
y1 <- as.numeric(subData$Sub_metering_1)
y2 <- as.numeric(subData$Sub_metering_2)
y3 <- as.numeric(subData$Sub_metering_3)

# save png
png("plot3.png", width=480, height=480)

plot(x, y1, pch ="." , xlab="", ylab="Energy sub metering" )
lines(x, y1, col="black" )
lines(x, y2, col="red" )
lines(x, y3, col="blue" )

legend("topright", 
        c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
        lty=c(1,1), 
        lwd=c(2.5,2.5),col=c("black", "red", "blue"))

dev.off
