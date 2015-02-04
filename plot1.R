if (!"lubridate" %in% rownames(installed.packages())) install.packages("lubridate")
library(lubridate)
power <- read.table("./data/household_power_consumption.txt", header = TRUE, sep = ";")
power$Date <- dmy(power$Date) # convert the Date variable to class POSIXct
power$Time <- hms(power$Time) # convert the Time variable to class Period

