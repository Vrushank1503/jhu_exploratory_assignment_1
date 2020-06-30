df <- read.table("household_power_consumption.txt",header = TRUE,sep = ";")
subst <- df[subst$Date %in% c("1/2/2007","2/2/2007"),]
head(subst)
str(subst)
subst[,3] <- as.numeric(subst[,3])
subst[,4] <- as.numeric(subst[,4])
subst[,5] <- as.numeric(subst[,5])
subst[,6] <- as.numeric(subst[,6])
subst[,7] <- as.numeric(subst[,7])

datetime <- strptime(paste(subst$Date,subst$Time,sep = " "),"%d/%m/%Y %H:%M:%S")
head(datetime)

png("plot4.png",width = 480,height = 480)
par(mfrow = c(2,2))
plot(datetime,subst$Global_active_power,xlab = "",type = "l",ylab = "Global Active Power",col = "black")

plot(datetime,subst$Voltage,xlab = "datetime",ylab = "Voltage",type = "l",col = "black")

plot(datetime,subst$Sub_metering_1,ylab = "Energy sub metering",type = "l",col = "black")
points(datetime,subst$Sub_metering_2,type = "l",col = "red")
lines(datetime,subst$Sub_metering_2,type = "l",col = "red")
points(datetime,subst$Sub_metering_3,type = "l",col = "blue")
lines(datetime,subst$Sub_metering_3,type = "l",col = "blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty = 1,lwd = 2.5,col = c("black","red","blue"))

plot(datetime,subst$Global_reactive_power,xlab = "datetime",ylab = "Global_reactive_power",type = "l")
dev.off()
