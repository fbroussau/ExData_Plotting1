data = read.table("household_power_consumption.txt",header=TRUE,sep=";",colClasses= c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),na.string="?")
data$Date = as.Date(data$Date,"%d/%m/%Y")
data$Time = strptime(data$Time,"%H:%M:%S")
data = data[data$Date >= as.Date("01/02/2007","%d/%m/%Y") & data$Date <= as.Date("02/02/2007","%d/%m/%Y"),]

png(filename = "plot1.png",width = 480, height = 480)
hist(data$Global_active_power, main = "Global Active Power",col = "red", xlab = "Global Active Power (kilowatts)" )
dev.off()
