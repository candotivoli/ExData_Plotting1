
# set path to data file
dataPath <- "../household_power_consumption.txt"

# read data file 
powerCon <- read.table(dataPath, header=TRUE, stringsAsFactors = FALSE, sep=";")

# subset to just 1st and 2nd Feb 2007
powerDays <- subset(powerCon, Date %in% c("1/2/2007", "2/2/2007"))

# build vectors of numeric values of variables that came in as character
gap <- as.numeric(powerDays$Global_active_power)

# convert date and time columns to get vector of datetime
times <- strptime(paste(powerDays$Date, powerDays$Time), "%d/%m/%Y %H:%M:%S")

# Open PNG file with appropriate dimensions
png(filename = "plot2.png", width=480, height=480, units = "px")

# Make line plot
plot(times, gap, type="l", ylab="Global Active Power (kilowatts)", xlab="")

# Close device
dev.off()