
plot2 <- function() {
  library(png)
  #load necessary data
  data <- read.table("data/household_power_consumption.txt", header=TRUE, sep=";")
  data$Date <- as.Date(data$Date, format="%d/%m/%Y")
  working_data <- data[(data$Date == "2007-02-01" | data$Date == "2007-02-02"),]
  working_data$DateTime <- as.POSIXlt(paste(working_data$Date, working_data$Time))
  
  #Various parameters needed for the plots
  power1 <- as.numeric(as.character(working_data$Global_active_power))
  power2 <- as.numeric(as.character(working_data$Global_reactive_power))

  meter1 <- as.numeric(as.character(working_data$Sub_metering_1))
  meter2 <- as.numeric(as.character(working_data$Sub_metering_2))
  meter3 <- as.numeric(as.character(working_data$Sub_metering_3))

  #Create 2x2 grid for plotting
  png(filename="plot4.png", width=480, height=480)
  par(mfcol=c(2,2))
  
  #Top left plot
  plot(working_data$DateTime, power1, type="n", xlab = "", ylab = "Global Active Power (kilowatts)")
  lines(working_data$DateTime, power1, type="l")

  #Bottom left plot
  xrange = range(working_data$DateTime)
  yrange = range(meter1, meter2, meter3)
  plot(xrange, yrange, type="n", xlab = "", ylab = "Energy sub metering")
  legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=1)
  lines(working_data$DateTime, meter1, type="l", col="black")
  lines(working_data$DateTime, meter2, type="l", col="red")
  lines(working_data$DateTime, meter3, type="l", col="blue")
  
  #Top right plot
  plot(working_data$DateTime, working_data$Voltage, type="n", xlab = "datetime", ylab = "Voltage")
  lines(working_data$DateTime, working_data$Voltage, type="l")
  
  #Bottom right plot
  plot(working_data$DateTime, power2, type="n", xlab = "datetime", ylab = "Global_reactive_power")
  lines(working_data$DateTime, power2, type="l")
  
  
  dev.off()
}