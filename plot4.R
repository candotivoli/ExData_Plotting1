
# set path to data file
dataPath <- "../household_power_consumption.txt"

# read data file 
powerCon <- read.table(dataPath, header=TRUE, stringsAsFactors = FALSE, sep=";")

# subset to just 1st and 2nd Feb 2007
powerDays <- subset(powerCon, Date %in% c("1/2/2007", "2/2/2007"))

# build vectors of numeric values of variables that came in as character
gap <- as.numeric(powerDays$Global_active_power)
grp <- as.numeric(powerDays$Global_reactive_power)
voltage <- as.numeric(powerDays$Voltage)
sub1 <- as.numeric(powerDays$Sub_metering_1)
sub2 <- as.numeric(powerDays$Sub_metering_2)

# convert date and time columns to get vector of datetime
times <- strptime(paste(powerDays$Date, powerDays$Time), "%d/%m/%Y %H:%M:%S")

# Open PNG file with appropriate dimensions
png(filename = "plot4.png", width=480, height=480, units = "px")

# Set to 2x2 plot grid and reduce font size
oldPar <- par(mfrow = c(2, 2), pty = "s", cex=0.7 )


# Top Left - like Plot 2
plot(times, gap, type="l", ylab="Global Active Power", xlab="")

# Top Right - plot voltage against time
plot(times, voltage, type="l", ylab="Voltage", xlab="datetime")


# Bottom Left - very similar to Plot3
plot(times, sub1, type="l", ylab="Energy sub metering", xlab="", fg="black")
lines(times, sub2, col="red")
lines(times, powerDays$Sub_metering_3, col="blue")
legend(x="topright", legend=colnames(powerDays)[7:9], col=c("black","red","blue"), lwd=1, bty="n")

# Bottom Right - plot reactive power against time
plot(times, grp, type="l", ylab="Global_reactive_power", xlab="datetime")

# close device
dev.off()


