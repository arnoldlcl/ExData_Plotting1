# Subset the data by reading in specific rows (determined by opening the file beforehand in Notepad++)
skip <- 66637
nrows <- 2880

# Read the data in
power <- read.table("./data/household_power_consumption.txt", col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), sep = ";", skip = skip, nrows = nrows)
power$DateTime <- as.POSIXct(paste(power$Date, power$Time), format = "%d/%m/%Y %H:%M:%S") # merge Date and Time together and convert to class POSIXct

par(mfrow = c(2, 2), mar = c(4, 4, 2, 1)) # segment graphics device into a 2x2 grid
with(power, {
  plot(DateTime, Global_active_power, xlab = "", ylab = "Global Active Power", type = "l")
  plot(DateTime, Voltage, xlab = "datetime", type = "l")
  plot(DateTime, Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "n")
  points(DateTime, Sub_metering_1, type = "l")
  points(DateTime, Sub_metering_2, type = "l", col = "red")
  points(DateTime, Sub_metering_3, type = "l", col = "blue")
  legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n", cex = 0.66)
  plot(DateTime, Global_reactive_power, xlab = "datetime", type = "l")
  })
dev.copy(png, file = "plot4.png") # Copy plot to PNG file
dev.off()
