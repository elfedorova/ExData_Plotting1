## Reading data into R, subsetting the required data set

library(data.table)
data <- fread("household_power_consumption.txt", na.strings = c("NA", "?"))
power_subset <- data[Date %in% c("1/2/2007", "2/2/2007")]
power_subset[, datetime := strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S")][]

## Creating a plot 3 "Energy sub-metering"

with(power_subset, plot(datetime, Sub_metering_1,
                        ylab = "Energy sub metering", xlab = NA, type = "n"))

with(power_subset, lines(datetime, Sub_metering_1, col = "black"))
with(power_subset, lines(datetime, Sub_metering_2, col = "red"))
with(power_subset, lines(datetime, Sub_metering_3, col = "blue"))

legend("topright",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty = 1, col = c("black", "red", "blue"))


## Creating a PNG-file "Plot3"
dev.copy(png, file = "plot3.png", height = 480, width = 480)
dev.off()