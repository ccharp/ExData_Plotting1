# Read in Data
data <- read.table("data/household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")
data$Date <- as.Date(data$Date, "%d/%m/%Y")

# Use dates between 2007-02-01 and 2007-02-0
subsetted <- data[data$Date == "2007-2-1" | data$Date == "2007-2-2", ]

# PLOT PLOT PLOT
png("plot1.png")
hist(subsetted$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red", ps=10)
dev.off()