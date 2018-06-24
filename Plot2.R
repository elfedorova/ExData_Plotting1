## Reading data into R, subsetting the required data set

library(data.table)
data <- fread("household_power_consumption.txt", na.strings = c("NA", "?"))
power_subset <- data[Date %in% c("1/2/2007", "2/2/2007")]
power_subset[, datetime := strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S")][]

## Creating a plot 2 "Global active power"(kilowatts)

with(power_subset, plot(datetime, Global_active_power, t = "l",
                        ylab = "Global Active Power (kilowatts)", xlab = NA))

## Creating a PNG-file "Plot2"
dev.copy(png, file = "plot2.png", height = 480, width = 480)
dev.off()