library(data.table)

# We will only be using data from the dates 2007-02-01 and 2007-02-02
data <- fread("household_power_consumption.txt", na.strings = "?")[Date=="1/2/2007" | Date=="2/2/2007",]

# plot and save
png(filename = "plot1.png", width = 480, height = 480)

hist(data$Global_active_power, col="red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")

dev.off()

