## Read file

temp_data <- read.csv("household_power_consumption.txt", header = T, sep = ';', na.strings = "?", nrows = 2075259, check.names = F, stringsAsFactors = F, comment.char = "", quote = '\"')

## Change the date format
temp_data$Date <- as.Date(temp_data$Date, format ="%d/%m/%Y")

## Subsetting the data
data <- subset(temp_data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

## Remove temp_data
rm(temp_data)

## Converting dates
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

## Plot 4
par(mfrow = c(2,2), mar = c(4,4,2,1), oma = c(0,0,2,0))
with(data, {
        plot(Global_active_power ~ Datetime, type = "l", ylab = "Global Active Power", xlab = "")
        plot(Voltage ~ Datetime, type = "l", ylab = "Voltage", xlab = "datetime")
        plot(Sub_metering_1 ~ Datetime, type = "l", ylab = "Energy sub metering",xlab = "")
        lines(Sub_metering_2 ~ Datetime, col = 'Red')
        lines(Sub_metering_3 ~ Datetime, col = 'Blue')
        legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, bty = "n",legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        plot(Global_reactive_power ~ Datetime, type = "l", ylab = "Global_reactive_power", xlab = "datetime")
})

## Copy plot to png

dev.copy(png,"plot4.png", width=480, height=480)

## Close the device

dev.off()