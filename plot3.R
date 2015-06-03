data = read.table("household_power_consumption.txt",header=TRUE,sep=";",colClasses= c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),na.string="?")
data["Date1"] = as.Date(data$Date,"%d/%m/%Y")
data = data[data$Date1 >= as.Date("01/02/2007","%d/%m/%Y") & data$Date1 <= as.Date("02/02/2007","%d/%m/%Y"),]
data$day = strptime(paste(data$Date,data$Time),"%d/%m/%Y %H:%M:%S")

png(filename = "plot3.png",width = 480, height = 480)
plot(data$day,data$Sub_metering_1,  type="n", ylab = "Energy sub metring",xlab = "")
lines(data$day, data$Sub_metering_1, type="l")
lines(data$day, data$Sub_metering_2, type="l", col = "red")
lines(data$day, data$Sub_metering_3, type="l", col = "blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1),col=c("black","blue","red"))
dev.off()
