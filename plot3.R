df <- read.table("household_power_consumption.txt",header = TRUE,sep = ";")
subst <- df[df$Date %in% c("1/2/2007","2/2/2007"),]
head(subst)
str(subst)

datetime <- strptime(paste(subst$Date,subst$Time,sep = ""),"%d/%m/%Y %H:%M:%S")
head(datetime)
subst$Global_active_power <- as.numeric(subst$Global_active_power)
subst$Sub_metering_1 <- as.numeric(subst$Sub_metering_1)
subst$Sub_metering_2 <- as.numeric(subst$Sub_metering_2)
subst$Sub_metering_3 <- as.numeric(subst$Sub_metering_3)

png("plot3.png",width = 480,height = 480)
plot(datetime,subst$Sub_metering_1,type = "l",ylab = "Energy Submetering",col = "black")
points(datetime,subst$Sub_metering_2,type = "l",col = "red")
lines(datetime,subst$Sub_metering_2,type = "l",col = "red")
points(datetime,subst$Sub_metering_3,type = "l",col = "blue" )
lines(datetime,subst$Sub_metering_3,type = "l",col = "blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty = 1,lwd = 2.5,col = c("black","red","blue"))
dev.off()

