# Read in Data
data <- read.table("data/household_power_consumption.txt", sep=";", header=TRUE, na.strings="?", colClasses=c(Date="character", Time="character"))

# TODO: good opportunity to use dplyr::mutate here
data$DateTime <- with(data, as.POSIXlt(paste(Date, Time), format="%d/%m/%Y %H:%M:%S"))

# Use dates between 2007-02-01 and 2007-02-0
subsetted <- data[which(data$DateTime >= "2007-2-1 00:00:00" & data$DateTime < "2007-2-3 00:00:00"), ]

# PLOT PLOT PLOT
png("plot4.png")
par(mfrow=c(2,2))
# 1
with(subsetted, plot(DateTime, Global_active_power, xlab="", ylab="Global Active Power (kilowatts)", type="l"))

# 2
with(subsetted, plot(DateTime, Voltage, xlab="", ylab="Voltage", type="l"))

# 3
with(subsetted, plot(DateTime, Sub_metering_1, xlab="", ylab="Memory sub metering", type="l"))
with(subsetted, lines(DateTime, Sub_metering_2, col="red"))
with(subsetted, lines(DateTime, Sub_metering_3, col="blue"))
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black", "red", "blue"), lty=1, cex=0.8)

# 4
with(subsetted, plot(DateTime, Global_reactive_power, xlab="", ylab="Global_reactive_power", type="l"))

dev.off()