## set Working directory set to where data "lives"
## packages required: sqldf

##read only the data from the dates that we want to observe
RawPower <- read.csv.sql("household_power_consumption.txt", header = TRUE, sep = ";", sql="Select * from file where Date = '1/2/2007' OR Date = '2/2/2007'")

##combine Date and Time columns while reformatting values to date/time
RawPower$Date <- strptime(paste(RawPower$Date, RawPower$Time), "%d/%m/%Y %H:%M:%S")

##Reserve the png file
png("plot2.png", height = 480, width = 480, bg = "transparent")

## create the line plot and print results to the reserved png file
plot(RawPower$Date, RawPower$Global_active_power, type = "l", xlab = " " , ylab = "Global Active Power (kilowatts)")
p=dev.off()




