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



### Plot 1 #######
### Histogram ####
png("plot1.png", width = 480, height = 480, units = "px")

hist(epc_subset$Global_active_power, main = "Global Active Power", xlab="Global Active Power (kilowatts)",
     col = "red")

dev.off()