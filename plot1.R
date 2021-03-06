# Subset the data by reading in specific rows (determined by opening the file beforehand in Notepad++)
skip <- 66637
nrows <- 2880

# Read the data in
power <- read.table("./data/household_power_consumption.txt", col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), sep = ";", skip = skip, nrows = nrows)
power$DateTime <- as.POSIXct(paste(power$Date, power$Time), format = "%d/%m/%Y %H:%M:%S") # merge Date and Time together and convert to class POSIXct

png(file = "plot1.png") # open PNG graphics device
hist(power$Global_active_power, xlab = "Global Active Power (kilowatts)", main = "Global Active Power", col = "red") # draw plot
dev.off() # close PNG graphics device
