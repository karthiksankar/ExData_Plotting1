#Read and subset the data
fullData <- read.table('household_power_consumption.txt', header = TRUE, sep = ';', stringsAsFactors = FALSE)
subsetData <- fullData[fullData$Date %in% c("1/2/2007","2/2/2007") ,]

#Make data numeric
subsetData$Sub_metering_1 <- as.numeric(as.character(subsetData$Sub_metering_1))
subsetData$Sub_metering_2 <- as.numeric(as.character(subsetData$Sub_metering_2))
subsetData$Sub_metering_3 <- as.numeric(as.character(subsetData$Sub_metering_3))

#Create PNG file
png("plot3.png", width=480, height=480)

#Plot the graph
with(subsetData, plot(strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S"), Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering"))
with(subsetData, lines(strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S"), Sub_metering_2, type = "l", col="red"))
with(subsetData, lines(strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S"), Sub_metering_3, type = "l", col="blue"))
legend("topright", lty= 1, col = c("black", "red", "blue"), legend = c( "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#Close the file
dev.off()