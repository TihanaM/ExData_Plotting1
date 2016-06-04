##PLOT 3

##The data set describing the Electric Power Consumption was analyzed during a timeframe:2007-02-01 and 2007-02-02.
##In Plot 3, the three Sub_metering variables, were analyzed over time.
##
##
##1. The whole data set is read in
##2. The Date variable is converted using strptime()
##3. Data is subsetted to only include the data to be analyzed.
##4. The Global_active_power variable is reformatted as a numeric vector
##5. "timestamp", consisting of data&time and reformated as a POSIXct class is added as an additional column to "all_data_subset".
##6. The Sub_metering_1 and Sub_metering_2 factors are converted to numeric.
##7. A line plot is generated for Sub_metering_1 variable vs. Time. The y-axis is changed and the x-axis is deleted.Plot colour is  set to black.
##8. Two additional lines are added to the plot to show the relationship of Sub_metering_2 and Sub_metering_3 vs. time.
##9. A PNG file is generated and saved as "plot3.png" with a width of 480 pixels and a height of 480 pixels.




all_data<-read.table("household_power_consumption.txt", header=TRUE, sep=";")
all_data$Date<-strptime(all_data$Date, format="%d/%m/%Y")
all_data_subset<-subset(all_data, Date>="2007-02-01" & Date<="2007-02-02")
all_data_subset$Global_active_power<-as.numeric(as.character(all_data_subset$Global_active_power))
all_data_subset <- transform(all_data_subset, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")


all_data_subset$Sub_metering_1<-as.numeric(as.character(all_data_subset$Sub_metering_1))
all_data_subset$Sub_metering_2<-as.numeric(as.character(all_data_subset$Sub_metering_2))


plot(Sub_metering_1~timestamp, data=all_data_subset, type="l", ylab="Energy sub metering", xlab="", col="black",cex.lab=0.75, cex.axis=0.75)
lines(all_data_subset$timestamp,all_data_subset$Sub_metering_2, type="l",col="red")
lines(all_data_subset$timestamp,all_data_subset$Sub_metering_3, type="l",col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1), lwd=c(2.5,2.5,2.5), col = c("black", "red", "blue"),cex=0.6)


dev.copy(png, file="plot3.png", width=480, height=480)
dev.off()