
plot2 <- function() {
  library(png)
  #load necessary data
  data <- read.table("data/household_power_consumption.txt", header=TRUE, sep=";")
  data$Date <- as.Date(data$Date, format="%d/%m/%Y")
  working_data <- data[(data$Date == "2007-02-01" | data$Date == "2007-02-02"),]
  working_data$DateTime <- as.POSIXlt(paste(working_data$Date, working_data$Time))
  power <- as.numeric(as.character(working_data$Global_active_power))
  
  #Plot the line plot
  png(filename="plot2.png", width=480, height=480)
  plot(working_data$DateTime, power, type="n", xlab = "", ylab = "Global Active Power (kilowatts)")
  lines(working_data$DateTime, power, type="l")
  dev.off()
}