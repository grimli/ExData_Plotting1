## move to a proper working directory
setwd("/home/bompiani/Dropbox/Exploratory Data Analisys/ExData_Plotting1/")

## load data in memory
values <- read.csv2(file = "./household_power_consumption.txt" , sep =";", na.strings="?", dec=".", colClasses=c("character","character","real","real","real","real","real","real","real"))
# cast date to a proper format
values$DateTime <- strptime(paste(values[,1], values[,2]), format = "%d/%m/%Y %H:%M:%S")
#select rilevant values
values <- subset(values, DateTime >= "2007-02-01" & DateTime <= "2007-02-03")
hist(values$Global_active_power, col="red", main = "Global Active Power", xlab ="Global Active Power (kilowatts)")