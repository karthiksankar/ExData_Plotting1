#Read and subset the data
fullData <- read.table('household_power_consumption.txt', header = TRUE, sep = ';', stringsAsFactors = FALSE)
subsetData <- fullData[fullData$Date %in% c("1/2/2007","2/2/2007") ,]

#Make data numeric
subsetData$Global_active_power <- as.numeric(as.character(subsetData$Global_active_power))

#Create PNG file
png("plot2.png", width=480, height=480)

#Plot the graph
with(subsetData, plot(strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S"), Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)"))

#Close the file
dev.off()