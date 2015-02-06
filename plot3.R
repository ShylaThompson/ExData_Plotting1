## set Working directory set to where data "lives"
## packages required: sqldf

##read only the data from the dates that we want to observe
RawPower <- read.csv.sql("household_power_consumption.txt", header = TRUE, sep = ";", sql="Select * from file where Date = '1/2/2007' OR Date = '2/2/2007'")

##combine Date and Time columns while reformatting values to date/time
RawPower$Date <- strptime(paste(RawPower$Date, RawPower$Time), "%d/%m/%Y %H:%M:%S")

##Reserve the png file
png("plot3.png", height = 480, width = 480, bg = "transparent")

## create the line plot and additional lines, add a legend, and print results to the reserved png file
plot(RawPower$Date, RawPower$Sub_metering_1, type = "l", xlab = " ", ylab = "Energy sub metering", ylim=c(0,40), col = "black")

lines(RawPower$Date, RawPower$Sub_metering_2, type = "l", col = "red" )
lines(RawPower$Date, RawPower$Sub_metering_3, type = "l", col = "blue" )

legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=c(1,1,1),col=c("black","red","blue"))

p=dev.off()

