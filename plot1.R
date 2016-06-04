##PLOT 1

##The data set describing the Electric Power Consumption was analyzed during a timeframe:2007-02-01 and 2007-02-02.
##In Plot 1, the variable Global Active Power, describing the household global minute-averaged active power (in kilowatt) was analyzed through a histogram.
##
##
##1. The whole data set is read in
##2. The Date variable is converted using strptime()
##3. Data is subsetted to only include the data to be analyzed.
##4. The Global_active_power variable is reformatted as a numeric vector
##5. A histogram plot is generated for the Global_active_power variable, where the colour of the fill is specified, as well as the title and the axis-labels.
##6. A PNG file is generated and saved as "plot1.png" with a width of 480 pixels and a height of 480 pixels.




all_data<-read.table("household_power_consumption.txt", header=TRUE, sep=";")
all_data$Date<-strptime(all_data$Date, format="%d/%m/%Y")
all_data_subset<-subset(all_data, Date>="2007-02-01" & Date<="2007-02-02")
all_data_subset$Global_active_power<-as.numeric(as.character(all_data_subset$Global_active_power))

hist(all_data_subset$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()



