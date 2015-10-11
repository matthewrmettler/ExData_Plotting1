
plot1 <- function() {
  library(png)
  #load necessary data
  data <- read.table("data/household_power_consumption.txt", header=TRUE, sep=";")
  data$Date <- as.Date(data$Date, format="%d/%m/%Y")
  working_data <- data[(data$Date == "2007-02-01" | data$Date == "2007-02-02"),]
  power <- as.numeric(as.character(working_data$Global_active_power))
  
  #Plot the histogram
  png(filename="plot1.png", width=480, height=480)
  hist(power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
  dev.off()
}