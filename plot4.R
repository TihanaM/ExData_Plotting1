##PLOT 4

##The data set describing the Electric Power Consumption was analyzed during a timeframe:2007-02-01 and 2007-02-02.
##In Plot 4, the three Sub_metering variables, were analyzed over time.
##
##
##1. The whole data set is read in
##2. The Date variable is converted using strptime()
##3. Data is subsetted to only include the data to be analyzed.
##4. The Global_active_power variable is reformatted as a numeric vector
##5. "timestamp", consisting of data&time and reformatted as a POSIXct class is added as an additional column to "all_data_subset".
##6. The Sub_metering_1 and Sub_metering_2, Voltage, and Global_reactive_power factors are converted to numeric.
##7. The graphing window is split for four graphs into two rows and two columns.
##8. Plot2 and Plot3, in addition to two further plots (Voltage vs. Time, and Global_reactive_power vs Time)are plotted.
##9. The letters of the labels and the legend have been made a bit smaller than default, the legend box border has been deleted, to reflect the appearance of the assigned graphs.
##10. A PNG file is generated and saved as "plot3.png" with a width of 480 pixels and a height of 480 pixels.




all_data<-read.table("household_power_consumption.txt", header=TRUE, sep=";")
all_data$Date<-strptime(all_data$Date, format="%d/%m/%Y")
all_data_subset<-subset(all_data, Date>="2007-02-01" & Date<="2007-02-02")
all_data_subset$Global_active_power<-as.numeric(as.character(all_data_subset$Global_active_power))

all_data_subset <- transform(all_data_subset, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")

all_data_subset$Sub_metering_1<-as.numeric(as.character(all_data_subset$Sub_metering_1))
all_data_subset$Sub_metering_2<-as.numeric(as.character(all_data_subset$Sub_metering_2))
all_data_subset$Voltage<-as.numeric(as.character(all_data_subset$Voltage))
all_data_subset$Global_reactive_power<-as.numeric(as.character(all_data_subset$Global_reactive_power))



par(mfrow=c(2,2)) 

plot(Global_active_power~timestamp, data=all_data_subset, type="l", ylab="Global Active Power (kilowatts)", xlab="",cex.lab=0.75, cex.axis=0.75 )

plot(Voltage~timestamp, data=all_data_subset, type="l", ylab="Voltage", xlab="datetime", col="black",cex.lab=0.75, cex.axis=0.75)

plot(Sub_metering_1~timestamp, data=all_data_subset, type="l", ylab="Energy sub metering", xlab="", col="black",cex.lab=0.75, cex.axis=0.75)
lines(all_data_subset$timestamp,all_data_subset$Sub_metering_2, type="l",col="red")
lines(all_data_subset$timestamp,all_data_subset$Sub_metering_3, type="l",col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1), lwd=c(2.5,2.5,2.5), col = c("black", "red", "blue"),cex=0.6, bty="n")

plot(Global_reactive_power~timestamp, data=all_data_subset, type="l", ylab="Global_reactive_power", xlab="datetime", col="black",cex.lab=0.75, cex.axis=0.75)

dev.copy(png, file="plot4.png", width=480, height=480)
dev.off()