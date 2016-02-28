# set path to data file
dataPath <- "../household_power_consumption.txt"

# read data file 
powerCon <- read.table(dataPath, header=TRUE, stringsAsFactors = FALSE, sep=";")

# subset to just 1st and 2nd Feb 2007
powerDays <- subset(powerCon, Date %in% c("1/2/2007", "2/2/2007"))

# build vectors of numeric values of variables that came in as character
gap <- as.numeric(powerDays$Global_active_power)

# Open PNG file with appropriate dimensions
png(filename = "plot1.png", width=480, height=480, units = "px")

# Histogram plot
hist(gap, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")

# Close device
dev.off()