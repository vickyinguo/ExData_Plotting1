## read in all data
readdata <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
## change Date from factor or Date format
readdata$Date <- as.Date(readdata$Date,"%d/%m/%Y")
## subset data
data <- subset(readdata, readdata$Date == "2007-02-01" | readdata$Date == "2007-02-02")
## change Global_active_power from factor to numeric
data$Global_active_power <- as.numeric(as.character(data$Global_active_power))
## change Global_reactive_power from factor to numeric
data$Global_reactive_power <- as.numeric(as.character(data$Global_reactive_power))
## change Voltage from factor to numeric
data$Voltage <- as.numeric(as.character(data$Voltage))
## change to numeric for these 3 fields
data$Sub_metering_1 <- as.numeric(as.character(data$Sub_metering_1))
data$Sub_metering_2 <- as.numeric(as.character(data$Sub_metering_2))
data$Sub_metering_3 <- as.numeric(as.character(data$Sub_metering_3))
## combine Date and Time and make it into weekdays
datetime <- as.POSIXct(paste(data$Date, data$Time), format="%Y-%m-%d %H:%M:%S")
## combine with data
newdata <- cbind(data, datetime)
## split the screen
par(mfrow = c(2,2))
##draw histogram
with(newdata, {
    ##1
    plot(datetime, Global_active_power,xlab = "", ylab = "Global Active Power", type="l")
    ##2
    plot(datetime, Voltage, type="l")
    ##3
    plot(datetime, Sub_metering_1,xlab = "", ylab = "Energy sub metering", type="l")
    lines(datetime, Sub_metering_2, col = "red")
    lines(datetime, Sub_metering_3, col = "blue")
    ## add legend
    legend("topright", lwd = 1, bty = "n", col=c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
    ##4
    plot(datetime, Global_reactive_power, type="l")
})
##store into png
dev.copy(png, file = "plot4.png", width = 480, height = 480)
dev.off()