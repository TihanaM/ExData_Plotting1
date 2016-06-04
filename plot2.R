##PLOT 2

##The data set describing the Electric Power Consumption was analyzed during a timeframe:2007-02-01 and 2007-02-02.
##In Plot 2, the Global Active Power variable, describing the household global minute-averaged active power (in kilowatt) was analyzed over time.
##
##
##1. The whole data set is read in
##2. The Date variable is converted using strptime()
##3. Data is subsetted to only include the data to be analyzed.
##4. The Global_active_power variable is reformatted as a numeric vector
##5. "timestamp", consisting of data&time and reformated as a POSIXct class is added as an additional column to "all_data_subset".
##6. A line plot is generated for the Global_active_power variable vs. Time. The y-axis is changed and the x-axis is deleted.
##7. A PNG file is generated and saved as "plot2.png" with a width of 480 pixels and a height of 480 pixels.




all_data<-read.table("household_power_consumption.txt", header=TRUE, sep=";")
all_data$Date<-strptime(all_data$Date, format="%d/%m/%Y")
all_data_subset<-subset(all_data, Date>="2007-02-01" & Date<="2007-02-02")
all_data_subset$Global_active_power<-as.numeric(as.character(all_data_subset$Global_active_power))
all_data_subset <- transform(all_data_subset, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")

plot(Global_active_power~timestamp, data=all_data_subset, type="l", ylab="Global Active Power (kilowatts)", xlab="")



dev.copy(png, file="plot2.png", width=480, height=480)
dev.off()