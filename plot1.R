#This script assumes that dataset is located in your working directory
#The file household_power_consumption.txt is download and extracted from archive
#The script creates the PLOT 1 with HISTOGRAM for the variable GLOBAL ACTIVE POWER

#Loading Data
data_full<-read.csv("household_power_consumption.txt", sep=";",header=TRUE, dec = ".")
data_subset<-subset(data_full, Date %in% c("1/2/2007","2/2/2007"))
data_subset$Global_active_power<-as.numeric(as.character(data_subset$Global_active_power))

#Create Graph
png("plot1.png",width=480,height=480)
hist(data_subset$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
