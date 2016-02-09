library(data.table)

# We will only be using data from the dates 2007-02-01 and 2007-02-02
data <- fread("household_power_consumption.txt", na.strings = "?")[Date=="1/2/2007" | Date=="2/2/2007",]

# format
data[,`:=`(DateTime=as.POSIXct(strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S")), Time=NULL)]

# plot and save
png(filename = "plot2.png", width = 480, height = 480)

plot(data$DateTime, data$Global_active_power, type="n", xlab="", ylab="Global Active Power (kilowatts)")
lines(data$DateTime, data$Global_active_power)

dev.off()

