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

## Plot 3
with(data, {
        plot(Sub_metering_1 ~ Datetime, type = "l", 
             ylab = "Energy sub metering", xlab = "")
        lines(Sub_metering_2 ~ Datetime, col = 'Red')
        lines(Sub_metering_3 ~ Datetime, col = 'Blue')
})
legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))


## Copy plot to png

dev.copy(png,"plot3.png", width=480, height=480)

## Close the device

dev.off()