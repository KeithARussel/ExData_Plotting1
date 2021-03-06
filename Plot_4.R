library(dplyr)

### Open the dataset
HPC <- read.csv("C:/Users/Admin/Desktop/Coursera/Datasets/Exploratory Analysis/household_power_consumption/household_power_consumption.txt", sep=";")
### Fitler dataset for dates requested
HPC2 <- HPC[as.Date(HPC$Date, "%d/%m/%Y") %in% as.Date(c("2007-02-01", "2007-02-02")),]
### Combine dates
HPC3 <- HPC2
HPC3$datetime <- strptime(paste(HPC2$Date, HPC2$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S")

# Set Directory to send png file to:
setwd("C:/Users/Admin/Desktop/Coursera/Assignments/F - Exploratory Analysis/Assignment 1 - As Submitted")

# Open the png
png(file = "Plot4.png")

# Question 4 - multiple plots
par(mfrow = c(2,2), mar = c(4, 4, 2, 2), oma = c(0,0,2,0))
with(HPC3, {
  plot(x = HPC3$datetime, y = HPC3$Global_active_power, type = "l", ylab = "Global Active Power", xlab = " ")
  plot(x = HPC3$datetime, y = HPC3$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
  plot(y = HPC3$Sub_metering_1, x = HPC3$datetime, type="l", xlab = "", ylab = "Energy sub metering")
  lines(y = HPC3$Sub_metering_2, x = HPC3$datetime, type="l", col = "red", pch = 3)
  lines(y = HPC3$Sub_metering_3, x = HPC3$datetime, type="l", col = "blue", pch = 4)
  legend("topright",  c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "blue", "red"), lty = 1 )
  title(xlab = " ")
  plot(x = HPC3$datetime, y = HPC3$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
  mtext("Plot 4", outer = TRUE)
})

# Close the output stream
dev.off()