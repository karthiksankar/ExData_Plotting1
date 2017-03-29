#Read and subset the data
fullData <- read.table('household_power_consumption.txt', header = TRUE, sep = ';', stringsAsFactors = FALSE)
subsetData <- fullData[fullData$Date %in% c("1/2/2007","2/2/2007") ,]

#Make data numeric
subsetData$Global_active_power <- as.numeric(as.character(subsetData$Global_active_power))
subsetData$Global_reactive_power <- as.numeric(as.character(subsetData$Global_reactive_power))
subsetData$Voltage <- as.numeric(as.character(subsetData$Voltage))
subsetData$Sub_metering_1 <- as.numeric(as.character(subsetData$Sub_metering_1))
subsetData$Sub_metering_2 <- as.numeric(as.character(subsetData$Sub_metering_2))
subsetData$Sub_metering_3 <- as.numeric(as.character(subsetData$Sub_metering_3))

#Create PNG file
png("plot4.png", width=480, height=480)

#Split graph area
par(mfcol = c(2,2))

#Plot graph 1
with(subsetData, plot(strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S"), Global_active_power, type = "l", xlab = "", ylab = "Global Active Power"))

#Plot graph 2
with(subsetData, plot(strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S"), Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering"))
with(subsetData, lines(strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S"), Sub_metering_2, type = "l", col="red"))
with(subsetData, lines(strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S"), Sub_metering_3, type = "l", col="blue"))
legend("topright", lty= 1, col = c("black", "red", "blue"), legend = c( "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = 'n' )

#Plot graph 3
with(subsetData, plot(strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S"), Voltage, type = "l", xlab = "datetime", ylab = "Voltage"))

#Plot graph 4
with(subsetData, plot(strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S"), Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power"))

#Close the file
dev.off()