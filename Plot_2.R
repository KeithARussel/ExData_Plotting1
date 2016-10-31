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
png(file = "Plot2.png")

## Second Plot, works good!
plot2<- plot(x = HPC3$datetime, y = HPC3$Global_active_power, type = "l", xlab = " ", ylab = "Global Active Power (Kilowatts)")

# Close the output stream
dev.off()