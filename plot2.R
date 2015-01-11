library(sqldf)
f = read.csv.sql("household_power_consumption.txt",sep=";",header = TRUE,
                 sql = "select * from file where Date = '1/2/2007' or Date = '2/2/2007' ")
f$Date <- as.Date(f$Date,format = "%d/%m/%Y")
f$Dt <- as.POSIXct(paste(f$Date, f$Time))
png("plot2.png", width=480, height=480, units="px")
plot(f$Global_active_power~f$Dt,type ="l",xlab="",ylab="Global Active Power (kilowatts)")
dev.off()