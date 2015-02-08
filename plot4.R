##Loading the data

## Read the file
file <- "household_power_consumption.txt"
data <- read.table(file, header = TRUE, sep = ";",na.strings = "?")

## Remove the na
data <- na.omit(data)

##subset the data
subdata <-data[data$Date %in% c("1/2/2007","2/2/2007"),]

##convert the date and the time
subdata$Date <- as.Date(subdata$Date, "%d/%m/%Y")
time <- paste(subdata$Date, subdata$Time)
subdata$Time <- strptime(time, "%Y-%m-%d %H:%M:%S")

##setting parameters
par(mfrow = c(2,2))

##first plot
with(subdata, plot(Time, Global_active_power, type = "l",
                     ylab = "Global Active Power (kilowatts)",xlab = ""))
##second plot
with(subdata, plot(Time, Voltage, type = "l", xlab = "datetime"))

##Third plot
plot(subdata$Time,subdata$Sub_metering_1, type = "l",xlab = "", ylab = "Energy sub metering")
lines(subdata$Time,subdata$Sub_metering_2,col = "red")
lines(subdata$Time,subdata$Sub_metering_3,col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),
       col = c("black","red","blue"),lty = 1, box.lty = 0)

##Fourth Plot
with(subdata, plot(Time, Global_reactive_power, type = "l",
                   ylab = "Global_reactive_power",xlab = "datetime"))