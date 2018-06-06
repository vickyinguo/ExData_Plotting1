## read in all data
readdata <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
## change Date from factor or Date format
readdata$Date <- as.Date(readdata$Date,"%d/%m/%Y")
## subset data
data <- subset(readdata, readdata$Date == "2007-02-01" | readdata$Date == "2007-02-02")
## change Global_active_power from factor to numeric
data$Global_active_power <- as.numeric(as.character(data$Global_active_power))
## combine Date and Time and make it into weekdays
datetime <- as.POSIXct(paste(data$Date, data$Time), format="%Y-%m-%d %H:%M:%S")
## combine with data
newdata <- cbind(data, datetime)
## draw chart
plot(datetime, newdata$Global_active_power,xlab = "", ylab = "Global Active Power (kilowatts)", type="l")
##store into png
dev.copy(png, file = "plot2.png", width = 480, height = 480)
dev.off()