
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
png(filename = "plot3.png", width=480, height=480, units = "px")

# Line plot of sub meter 1
plot(times, sub1, type="l", ylab="Energy sub metering", xlab="", fg="black")

# Add lines for sub meter 2 in red
lines(times, sub2, col="red")

# Add lines for sub meter 3 in blue
lines(times, powerDays$Sub_metering_3, col="blue")

# Add legend - use appropriate colnames
legend(x="topright", legend=colnames(powerDays)[7:9], col=c("black","red","blue"), lwd=1)

# Close device
dev.off()