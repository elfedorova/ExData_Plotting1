## Reading data into R, subsetting the required data set

library(data.table)
data <- fread("household_power_consumption.txt", na.strings = c("NA", "?"))
power_subset <- data[Date %in% c("1/2/2007", "2/2/2007")]

## Creating histogram "Global active power"

hist(power_subset$Global_active_power, main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)", col = "red")

## Creating a PNG-file "Plot1"
dev.copy(png, file = "plot1.png", height = 480, width = 480)
dev.off()