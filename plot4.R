#Setting local language to English. 

Sys.setlocale("LC_TIME", "English")

#Setting working directory in local machine

setwd("D:\\RCoursera\\Exploratory Analisis")


#Reading file with "read.csv".

epc <- read.csv("household_power_consumption.txt", sep = ";", na.strings = "?",
                stringsAsFactors = F)


#Paste the columns Date and Time, so we can apply strptime() after...


epc$Date.Time <- paste(epc$Date, epc$Time, sep = " ")

#Applying strptime() to get a Date column.


epc$Date.Time <- strptime(epc$Date.Time, format = "%d/%m/%Y %H:%M:%S")


#Subsetting the desire dates for the project


epc_subset <- epc[epc$Date.Time >= "2007-02-01 00:00:00" & epc$Date.Time <= "2007-02-03 00:00:00",]


### Plot 4 ###


png("plot4.png", width = 480, height = 480, units = "px")
par(mfrow=c(2,2)) 
plot(epc_subset$Date.Time, epc_subset$Global_active_power, xlab = "", ylab = "Global Active Power (Kilowatts)", type = "l")
plot(epc_subset$Date.Time, epc_subset$Voltage, xlab = "datetime", ylab = "Voltage", type = "l")
hist(disp)
plot(epc_subset$Date.Time, epc_subset$Sub_metering_1, xlab = "", ylab = "Energie sub metering", type = "l")
lines(epc_subset$Date.Time, epc_subset$Sub_metering_2, col = "red", type = "l")
lines(epc_subset$Date.Time, epc_subset$Sub_metering_3, col = "blue", type = "l")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col = c("black", "red", "blue"))
plot(epc_subset$Date.Time, epc_subset$Global_reactive_power, xlab = "datetime", ylab = "Global_reactive_power", type = "l")
dev.off()