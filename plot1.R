df <- read.table("household_power_consumption.txt",header = TRUE,sep = ";")
head(df)
subst <- df[df$Date %in% c("1/2/2007","2/2/2007"),]
head(subst)
str(subst)
subst$Global_active_power <- as.numeric(subst$Global_active_power)
png(filename = "plot1.png",width = 480,height = 480)
hist(subst$Global_active_power,col = "red",main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")
dev.off()
