
plot2 <- function() {
  library(png)
  #load necessary data
  data <- read.table("data/household_power_consumption.txt", header=TRUE, sep=";")
  data$Date <- as.Date(data$Date, format="%d/%m/%Y")
  working_data <- data[(data$Date == "2007-02-01" | data$Date == "2007-02-02"),]
  working_data$DateTime <- as.POSIXlt(paste(working_data$Date, working_data$Time))
  
  meter1 <- as.numeric(as.character(working_data$Sub_metering_1))
  meter2 <- as.numeric(as.character(working_data$Sub_metering_2))
  meter3 <- as.numeric(as.character(working_data$Sub_metering_3))
  
  xrange = range(working_data$DateTime)
  yrange = range(meter1, meter2, meter3)
  #Plot the line plots
  png(filename="plot3.png", width=480, height=480)
  plot(xrange, yrange, type="n", xlab = "", ylab = "Energy sub metering")
  legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=1)
  lines(working_data$DateTime, meter1, type="l", col="black")
  lines(working_data$DateTime, meter2, type="l", col="red")
  lines(working_data$DateTime, meter3, type="l", col="blue")
  dev.off()
}