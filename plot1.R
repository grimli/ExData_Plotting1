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

#create plot on video
hist(values$Global_active_power, col="red", main = "Global Active Power", xlab ="Global Active Power (kilowatts)")

#export plot to file
png(filename = "plot1.png",width = 480, height = 480)
hist(values$Global_active_power, col="red", main = "Global Active Power", xlab ="Global Active Power (kilowatts)")
dev.off()