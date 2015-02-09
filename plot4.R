library(sqldf)
setwd("C:/Users/user/Desktop/coursera")
data <- read.csv.sql("household_power_consumption.txt", header=TRUE, sep=";",
                     sql="Select * from file where Date = '1/2/2007' OR Date = '2/2/2007'")
#converting
as.Date(data$Date, "%d/%m/%Y")
strptime(data$Time, "%S:%M:%H")
#Plot 4
windows(width=10, height=8)

png("plot4.png",width = 480,height = 480)
par(mfrow=c(2,2))
plot(data$Global_active_power,type="l",xaxt='n', ylab="Global Active Power(kilowatts)")

axis(1, at=c(0, 1480, 2880), labels=c("Thursday", "Friday","Saturday" ))

plot(data[,5], type="l", ylab="Voltage", xlab="Datetime")

plot(data[,7], type="l", ylab="Energy sub metering") 
lines(data[,8], col="red")
lines(data[,9], col="blue")

legend("topright",lty=1,  col=1:3,  c("sub_metering_1","sub_metering_2","sub_metering_3"))

plot(data[,4], ylab="Global reactive power", xlab="datetime", type="l")
dev.off()