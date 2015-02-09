library(sqldf)
setwd("C:/Users/user/Desktop/coursera")
data <- read.csv.sql("household_power_consumption.txt", header=TRUE, sep=";",
                     sql="Select * from file where Date = '1/2/2007' OR Date = '2/2/2007'")
#converting
as.Date(data$Date, "%d/%m/%Y")
strptime(data$Time, "%S:%M:%H")
#Plot 3
png("plot3.png",width = 480,height = 480)
plot(data[,7], type="l", ylab="Energy sub metering") 
lines(data[,8], col="red")
lines(data[,9], col="blue")

legend("topright",lty=1,  col=1:3,  c("sub_metering_1","sub_metering_2","sub_metering_3"))
dev.off()