# Read in Data
data <- read.table("data/household_power_consumption.txt", sep=";", header=TRUE, na.strings="?", colClasses(Date="character", Time="character"))

# TODO: good opportunity to use dplyr::mutate here
data$DateTime <- with(data, as.POSIXlt(paste(Date, Time), format="%d/%m/%Y %H:%M:%S"))

# Use dates between 2007-02-01 and 2007-02-0
subsetted <- data[which(data$DateTime >= "2007-2-1 00:00:00" & data$DateTime < "2007-2-3 00:00:00"), ]

# PLOT PLOT PLOT
png("plot2.png")
with(subsetted, plot(DateTime, Global_active_power, xlab="", ylab="Global Active Power (kilowatts)", type="l"))
dev.off()