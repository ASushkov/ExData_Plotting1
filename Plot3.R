setwd('c:\\Work\\_Coursera\\Explo');
data_csv <-read.csv("./household_power_consumption.txt", header = TRUE, sep = ';',na.strings = "?", nrows = 2075259, check.names = FALSE, stringsAsFactors = FALSE, comment.char = "", quote = '\"')
data_csv$Date <-as.Date(data_csv$Date, format = "%d/%m/%Y")
data_new <-subset(data_csv, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
datetime <-paste(as.Date(data$Date), data_new$Time)
data_new$Datetime <-as.POSIXct(datetime)

## Plot 3
with(data_new,{
  plot(Sub_metering_1 ~ Datetime, type = "l", ylab = "Energy sub metering", xlab = "") 
  lines(Sub_metering_2 ~ Datetime, col = 'Red')
  lines(Sub_metering_3 ~ Datetime, col = 'Blue')
})
legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

