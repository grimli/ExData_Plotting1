## To use this script you have to copy the uncompressed file household_power_consumption.txt with data in the working directory

## move to a proper working directory
## uncomment the next line and insert the correct path to the R script 
## setwd("<path to the working directory>")

## load data in memory
values <- read.csv2(file = "./household_power_consumption.txt" , sep =";", na.strings="?", dec=".", colClasses=c("character","character","real","real","real","real","real","real","real"))
# cast date to a proper format
values$DateTime <- strptime(paste(values[,1], values[,2]), format = "%d/%m/%Y %H:%M:%S")
#select rilevant values
values <- subset(values, DateTime >= "2007-02-01" & DateTime <= "2007-02-03")

# Set system values to get labels in the correct language
Sys.setlocale("LC_TIME", "en_US.UTF-8")

# Create plot on video
par(mfrow = c(2, 2))
# First plot
plot(values$DateTime, values$Global_active_power, type = "l", xlab ="", ylab = "Global Active Power (kilowatts)")
# Second Plot
plot(values$DateTime, values$Voltage, type = "l", xlab ="datetime", ylab = "Voltage")
# Third Plot
plot(values$DateTime, values$Sub_metering_1, type = "n", xlab ="", ylab = "Energy sub metering")
lines(values$DateTime, values$Sub_metering_1)
lines(values$DateTime, values$Sub_metering_2, col="red")
lines(values$DateTime, values$Sub_metering_3, col="blue")
legend("topright", col = c("black","red","blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lwd=1, bty = "n")
# Fourth Plot
plot(values$DateTime, values$Global_reactive_power, type = "l", xlab ="datetime", ylab = "Global_active_power")

#export plot to file
png(filename = "plot4.png",width = 480, height = 480)
par(mfrow = c(2, 2))
# First plot
plot(values$DateTime, values$Global_active_power, type = "l", xlab ="", ylab = "Global Active Power (kilowatts)")
# Second Plot
plot(values$DateTime, values$Voltage, type = "l", xlab ="datetime", ylab = "Voltage")
# Third Plot
plot(values$DateTime, values$Sub_metering_1, type = "n", xlab ="", ylab = "Energy sub metering")
lines(values$DateTime, values$Sub_metering_1)
lines(values$DateTime, values$Sub_metering_2, col="red")
lines(values$DateTime, values$Sub_metering_3, col="blue")
legend("topright", col = c("black","red","blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lwd=1, bty = "n")
# Fourth Plot
plot(values$DateTime, values$Global_reactive_power, type = "l", xlab ="datetime", ylab = "Global_active_power")
dev.off()