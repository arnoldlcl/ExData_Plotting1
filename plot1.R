# Subset the data by reading in specific rows (determined by opening the file beforehand in Notepad++)
skip <- 66637
nrows <- 2880

# Read the data in
power <- read.table("./data/household_power_consumption.txt", col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), sep = ";", skip = skip, nrows = nrows)
power$Date <- as.Date(power$Date, format = "%d/%m/%Y") # convert Date variable to class Date
power$Time <- strptime(power$Time, format = "%H:%M:%S") # convert Time variable to class POSIXlt. This results in the current date being added as well but should not affect the time

png(file = "plot1.png")
hist(power$Global_active_power, xlab = "Global Active Power (kilowatts)", main = "Global Active Power", col = "red")
dev.off()
