read.delim(file="household_power_consumption.txt",sep = ";") -> k
k[k$Date == "1/2/2007" | k$Date == "2/2/2007"  ,] -> l
png("graph2.png",width = 480, height = 480, units = "px")
plot((as.numeric(l$Global_active_power))/500,type="l",xaxt='n',xlab = "", ylab = "Global Active Power(Kilowatts)")
axis(1, at= c(0,1440,2880), labels=c("Fri","Sat","Sun"))
dev.off()