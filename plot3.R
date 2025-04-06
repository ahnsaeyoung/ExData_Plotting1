rm(list=ls())

setwd("C:/Users/sae_y/Desktop/ExData_Plotting1")

data <- read.csv("household_power_consumption.txt", sep=";")

date_time <- paste(data$Date, data$Time)

data$date_time <- strptime(date_time, format='%d/%m/%Y %H:%M:%S')

feb_subset <-subset(data, date_time<=as.POSIXlt("2007-02-02 24:00:00")&date_time>=as.POSIXlt("2007-02-01 00:00:00"))

col_names <- c("Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
feb_subset[col_names] <- sapply(feb_subset[col_names], as.numeric)



#plot3
png(filename="plot3,png", width=480, height=480)
with(feb_subset, plot(date_time, Sub_metering_1, type="l", xlab="",ylab="Energy sub metering"))
with(feb_subset, lines(date_time, Sub_metering_2, col="red"))
with(feb_subset, lines(date_time, Sub_metering_3, col="blue"))
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=1)
dev.off()