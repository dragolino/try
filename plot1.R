library(sqldf)
setwd("C:/Users/user/Desktop/coursera")
data <- read.csv.sql("household_power_consumption.txt", header=TRUE, sep=";",
                     sql="Select * from file where Date = '1/2/2007' OR Date = '2/2/2007'")
#converting
as.Date(data$Date, "%d/%m/%Y")
strptime(data$Time, "%S:%M:%H")
#Plot 1
png("plot1.png",width = 480,height = 480)
hist(data$Global_active_power, col="red", 
     main="Global active power", 
     xlab="Global active power(kilowatts)")
dev.off()