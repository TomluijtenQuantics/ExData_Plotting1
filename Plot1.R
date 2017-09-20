# Clear workspace
rm(list = ls())

# Load data, filter the relevant days, and make the data usable
Data <- read.table("household_power_consumption.txt", sep = ";", header = T)
Data <- Data[Data[,1] == "1/2/2007" | Data[,1] == "2/2/2007",]
DayTime <- strptime(paste(Data[,1], Data[,2], " "), format = '%d/%m/%Y %H:%M')
Data <- cbind(DayTime,Data[,3:9])
for (i in 2:8) {Data[,i] <- as.numeric(as.character(Data[,i]))}

# Plot1
hist(Data$Global_active_power, xlab = "Global Active Power (kilowatts)", main = "Global Active Power", col = "red")
dev.copy(png,'plot1.png', width = 480, height = 480)
dev.off()