x<- read.table(text=grep("^[1,2]/2/2007",readLines("household_power_consumption.txt"),value=TRUE),sep=";",skip=1,col.names=c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),na.strings="?")
x$Date <- as.Date(x$Date, format = '%d/%m/%Y')
x$DateTime <- as.POSIXct(paste(x$Date,x$Time))
png(filename="plot3.png",width=480,height=480,units="px")

Sys.setlocale(category="LC_ALL",locale="english")

plot(x$DateTime,x$Sub_metering_1,xlab="",ylab="Energy sub metering", type='l')
lines(x$DateTime,x$Sub_metering_2,col="red")
lines(x$DateTime,x$Sub_metering_3,col="blue")

legend("topright",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.off()