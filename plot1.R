library(sqldf)
f = read.csv.sql("household_power_consumption.txt",sep=";",header = TRUE,
                 sql = "select * from file where Date = '1/2/2007' or Date = '2/2/2007' ")
png("plot1.png", width=480, height=480, units="px")
#par(mar=c(4,4,1,1))
hist(f$Global_active_power,col="red",main = "Global Active Power"
     ,ylab = "Frequency",xlab="Global Active Power (kilowatts)")
dev.off()