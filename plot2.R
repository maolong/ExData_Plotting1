#This script assumes that dataset is located in your working directory
#The file household_power_consumption.txt is download and extracted from archive
#Environment is Sys.setlocale("LC_ALL","English")
#The script creates the PLOT 2 with LINE for the variable GLOBAL ACTIVE POWER and dimension DATE and TIME

#Loading Data
data_full<-read.csv("household_power_consumption.txt", sep=";",header=TRUE, dec = ".")
data_subset<-subset(data_full, Date %in% c("1/2/2007","2/2/2007"))
data_subset$Global_active_power<-as.numeric(as.character(data_subset$Global_active_power))
data_subset$datetime <-as.POSIXct(strptime(paste(as.Date(data_subset$Date, "%d/%m/%Y"), data_subset$Time), "%Y-%m-%d %H:%M:%S"))

#Create Graph
png("plot2.png",width=480,height=480)
plot(data_subset$datetime, data_subset$Global_active_power, col="black", type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()