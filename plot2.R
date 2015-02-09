library(sqldf)
setwd("C:/Users/user/Desktop/coursera")
data <- read.csv.sql("household_power_consumption.txt", header=TRUE, sep=";",
                     sql="Select * from file where Date = '1/2/2007' OR Date = '2/2/2007'")
#converting
as.Date(data$Date, "%d/%m/%Y")
strptime(data$Time, "%S:%M:%H")
#plot2
Sys.setlocale("LC_TIME", "English")
png("plot2.png",width = 480,height = 480)
plot(data$Global_active_power,type="l",xaxt='n', ylab="Global Active Power(kilowatts)")

axis(1, at=c(0, 1480, 2880), labels=c("Thursday", "Friday","Saturday" ))
dev.off()