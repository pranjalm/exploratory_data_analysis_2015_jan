read.delim(file="household_power_consumption.txt",sep = ";") -> k
k[k$Date == "1/2/2007" | k$Date == "2/2/2007"  ,] -> l
png("graph.png",width = 480, height = 480, units = "px")
hist((as.numeric(l$Global_active_power))/500 , col = "Red",xlab ="Global Active Power(Kilowatts)" , ylab = "Frequency",main = "Global Active Power")
dev.off()
