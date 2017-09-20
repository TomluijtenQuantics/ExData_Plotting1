# Clear workspace
rm(list = ls())

# Load data, filter the relevant days, and make the data usable
Data <- read.table("household_power_consumption.txt", sep = ";", header = T)
Data <- Data[Data[,1] == "1/2/2007" | Data[,1] == "2/2/2007",]
DayTime <- strptime(paste(Data[,1], Data[,2], " "), format = '%d/%m/%Y %H:%M')
Data <- cbind(DayTime,Data[,3:9])
for (i in 2:8) {Data[,i] <- as.numeric(as.character(Data[,i]))}

# Plot3
plot(Data$DayTime, Data$Sub_metering_1, type="n", xlab="", ylab="Energy sub metering", main = "") 
lines(Data$DayTime,Data$Sub_metering_1)
lines(Data$DayTime,Data$Sub_metering_2, col = "red")
lines(Data$DayTime,Data$Sub_metering_3, col = "blue")
legend("topright",lty=1,col = c("black","red","blue"), legend = names(Data)[6:8], cex = 0.75)
dev.copy(png,'plot3.png', width = 480, height = 480)
dev.off()