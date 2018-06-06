## read in all data
readdata <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
## change Date from factor or Date format
readdata$Date <- as.Date(readdata$Date,"%d/%m/%Y")
## subset data
data <- subset(readdata, readdata$Date == "2007-02-01" | readdata$Date == "2007-02-02")
## combine Date and Time and make it into weekdays
datetime <- as.POSIXct(paste(data$Date, data$Time), format="%Y-%m-%d %H:%M:%S")
## combine with data
newdata <- cbind(data, datetime)
# change to numeric for these 3 fields
newdata$Sub_metering_1 <- as.numeric(as.character(newdata$Sub_metering_1))
newdata$Sub_metering_2 <- as.numeric(as.character(newdata$Sub_metering_2))
newdata$Sub_metering_3 <- as.numeric(as.character(newdata$Sub_metering_3))
## draw chart
plot(datetime, newdata$Sub_metering_1,xlab = "", ylab = "Energy sub metering", type="l")
lines(datetime, newdata$Sub_metering_2, col = "red")
lines(datetime, newdata$Sub_metering_3, col = "blue")
## add legend
legend("topright", lwd = 1, col=c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
##store into png
dev.copy(png, file = "plot3.png", width = 480, height = 480)
dev.off()