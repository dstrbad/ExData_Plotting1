library(data.table)

# We will only be using data from the dates 2007-02-01 and 2007-02-02
data <- fread("household_power_consumption.txt", na.strings = "?")[Date=="1/2/2007" | Date=="2/2/2007",]

# format
data[,`:=`(Date=as.POSIXct(strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S")), Time=NULL)]

# plot and save
png("plot3.png", width=480, height=480)

plot(data$Date, data$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering", col="black")
lines(data$Date, data$Sub_metering_2, type="l", col="red")
lines(data$Date, data$Sub_metering_3, type="l", col="blue")
legend(x="topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1), col=c("black","red","blue"))

dev.off()
