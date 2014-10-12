read.delim(file="household_power_consumption.txt",sep = ";") -> k
k[k$Date == "1/2/2007" | k$Date == "2/2/2007"  ,] -> l
png("graph4.png",width = 480, height = 480, units = "px")
layout(matrix(c(1,2,3,4), 2, 2, byrow = TRUE))
plot((as.numeric(l$Global_active_power))/500,type="l",xaxt='n',xlab = "",
     ylab = "Global Active Power")
plot(as.numeric(l$Voltage),type="l",xaxt='n',xlab = "",
     ylab = "Voltage")
ylim=range(c(l$Sub_metering_1,l$Sub_metering_2,l$Sub_metering_3))
plot(as.numeric(l$Sub_metering_1),type="l",xaxt='n',xlab = "",
     ylim=ylim,ylab = "Energy sub metering")
par(new=T)
plot(as.numeric(l$Sub_metering_2),type="l", axes = FALSE,
     ylim=ylim,xlab = "", ylab = "Energy sub metering",col = "Red")
par(new=T)
plot(as.numeric(l$Sub_metering_3),type="l", axes = FALSE,
     ylim=ylim,xlab = "", ylab = "Energy sub metering",col="Blue")
par(new=F)
plot((as.numeric(l$Global_reactive_power))/500,type="l",xaxt='n',xlab = "",
     ylab = "Global_reactive_power")
axis(1, at= c(0,1440,2880), labels=c("Fri","Sat","Sun"))
dev.off()