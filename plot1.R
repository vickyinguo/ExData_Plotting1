## read in all data
readdata <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
## change Date from factor or Date format
readdata$Date <- as.Date(readdata$Date,"%d/%m/%Y")
## subset data
data <- subset(readdata, readdata$Date == "2007-02-01" | readdata$Date == "2007-02-02")
## change Global_active_power from factor to numeric
data$Global_active_power <- as.numeric(as.character(data$Global_active_power))
##draw histogram
hist(data$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)",col= "red")
##store into png
dev.copy(png, file = "plot1.png", width = 480, height = 480)
dev.off()