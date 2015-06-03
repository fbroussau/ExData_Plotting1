data = read.table("household_power_consumption.txt",header=TRUE,sep=";",colClasses= c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),na.string="?")
data["Date1"] = as.Date(data$Date,"%d/%m/%Y")
data = data[data$Date1 >= as.Date("01/02/2007","%d/%m/%Y") & data$Date1 <= as.Date("02/02/2007","%d/%m/%Y"),]
data$day = strptime(paste(data$Date,data$Time),"%d/%m/%Y %H:%M:%S")

png(filename = "plot2.png",width = 480, height = 480)
plot(data$day,data$Global_active_power,  type="n", ylab = "Global Active Power (kilowatts)",xlab = "")
lines(data$day, data$Global_active_power, type="l")
dev.off()
