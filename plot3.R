plot3 <- function(){
data <- read.table("household_power_consumption.txt", sep = ";", stringsAsFactors = F, header = T, na.strings = "?")
exactDate <- data[c(grep("^1/2/2007$", data$Date), grep("^2/2/2007$", data$Date)),]
row.names(exactDate) <- NULL
Date.Time <- paste(exactDate$Date, exactDate$Time, sep = " ")
names(exactDate) <- gsub("_", ".", names(exactDate), fixed = T)
dt <- data.frame(Date.Time, exactDate$Global.active.power, exactDate$Global.reactive.power, exactDate$Voltage, exactDate$Global.intensity, exactDate$Sub.metering.1, exactDate$Sub.metering.2, exactDate$Sub.metering.3)
names(dt) <- gsub("exactDate.", "", names(dt), fixed = T)
dt$Date.Time <- strptime(dt$Date.Time, "%d/%m/%Y %H:%M:%S")
png(filename = "plot3.png", width = 480, height = 480)
plot(dt$Date.Time, dt$Sub.metering.1, type = "l", ylab = "Energy Sub Metering", xlab = "")
lines(dt$Date.Time, dt$Sub.metering.2, col = "red")
lines(dt$Date.Time, dt$Sub.metering.3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1,1,1), lwd = c(2.5, 2.5, 2.5), col = c("black", "red", "blue"), cex = 0.8)
dev.off()
plot(dt$Date.Time, dt$Sub.metering.1, type = "l", ylab = "Energy Sub Metering", xlab = "")
lines(dt$Date.Time, dt$Sub.metering.2, col = "red")
lines(dt$Date.Time, dt$Sub.metering.3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1,1,1), lwd = c(2.5, 2.5, 2.5), col = c("black", "red", "blue"), cex = 0.8)
}
