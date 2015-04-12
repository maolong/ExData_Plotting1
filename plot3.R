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
data_subset$datetime <-as.POSIXct(strptime(paste(as.Date(data_subset$Date, "%d/%m/%Y"), data_subset$Time), "%Y-%m-%d %H:%M:%S"))

#Create Graph
png("plot3.png",width=480,height=480)
plot(data_subset$datetime, data_subset$Sub_metering_1, col="black", type="l", xlab="", ylab="Energy sub metering")
lines(data_subset$datetime, data_subset$Sub_metering_2, col="red")
lines(data_subset$datetime, data_subset$Sub_metering_3, col="blue")
legend("topright", lty=1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()