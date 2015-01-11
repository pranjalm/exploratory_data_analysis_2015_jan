library(sqldf)
f = read.csv.sql("household_power_consumption.txt",sep=";",header = TRUE,
                 sql = "select * from file where Date = '1/2/2007' or Date = '2/2/2007' ")
f$Date <- as.Date(f$Date,format = "%d/%m/%Y")
f$Dt <- as.POSIXct(paste(f$Date, f$Time))
png("plot4.png", width=480, height=480, units="px")
layout(matrix(c(1,2,3,4), 2, 2, byrow = TRUE))

plot(f$Global_active_power~f$Dt,type ="l",xlab="",ylab="Global Active Power (kilowatts)")

plot(f$Voltage~f$Dt,type ="l",xlab="",ylab="Voltage")

plot(f$Sub_metering_1~f$Dt,type="l",xlab = "",ylab = "Energy sub metering")
lines(f$Sub_metering_2~f$Dt,col="red")
lines(f$Sub_metering_3~f$Dt,col="blue")
legend("topright",lty=1, lwd=2,,legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col = c("black","red","blue"),cex = 0.75)
par(new=F)

plot(f$Global_reactive_power~f$Dt,type ="l",xlab="",ylab="Global Reactive Power (kilowatts)")

dev.off()