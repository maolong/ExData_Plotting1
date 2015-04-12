#This script assumes that dataset is located in your working directory
#The file household_power_consumption.txt is download and extracted from archive
#Environment is Sys.setlocale("LC_ALL","English")
#The script creates the PLOT 2 with LINE for the variables SUB METERING (1, 2 and 3) and dimension DATE and TIME

#Loading Data
data_full<-read.csv("household_power_consumption.txt", sep=";",header=TRUE, dec = ".")
data_subset<-subset(data_full, Date %in% c("1/2/2007","2/2/2007"))
data_subset$Sub_metering_1<-as.numeric(as.character(data_subset$Sub_metering_1))
data_subset$Sub_metering_2<-as.numeric(as.character(data_subset$Sub_metering_2))
data_subset$Sub_metering_3<-as.numeric(as.character(data_subset$Sub_metering_3))
data_subset$Global_active_power<-as.numeric(as.character(data_subset$Global_active_power))
data_subset$Global_reactive_power<-as.numeric(as.character(data_subset$Global_reactive_power))
data_subset$Voltage<-as.numeric(as.character(data_subset$Voltage))
data_subset$datetime <-as.POSIXct(strptime(paste(as.Date(data_subset$Date, "%d/%m/%Y"), data_subset$Time), "%Y-%m-%d %H:%M:%S"))

#Create Graph
par(mfrow = c(2, 2), mar = c(4, 4, 2, 2), oma=c(0,0,2,0))
plot(data_subset$datetime, data_subset$Global_active_power, col="black", type="l", xlab="", ylab="Global Active Power")
plot(data_subset$datetime, data_subset$Voltage, col="black", type="l", xlab="datetime", ylab="Voltage")
plot(data_subset$datetime, data_subset$Sub_metering_1, col="black", type="l", xlab="", ylab="Energy sub metering")
lines(data_subset$datetime, data_subset$Sub_metering_2, col="red")
lines(data_subset$datetime, data_subset$Sub_metering_3, col="blue")
plot(data_subset$datetime, data_subset$Global_reactive_power, col="black", type="l", xlab="datetime", ylab="Global_reactive_power")

#Save to PNG file
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()