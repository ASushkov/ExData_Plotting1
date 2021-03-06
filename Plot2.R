setwd('c:\\Work\\_Coursera\\Explo');
data_csv <-read.csv("./household_power_consumption.txt", header = TRUE, sep = ';',na.strings = "?", nrows = 2075259, check.names = FALSE, stringsAsFactors = FALSE, comment.char = "", quote = '\"')
data_csv$Date <-as.Date(data_csv$Date, format = "%d/%m/%Y")
data_new <-subset(data_csv, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
datetime <-paste(as.Date(data$Date), data_new$Time)
data_new$Datetime <-as.POSIXct(datetime)

## Plot 2
plot(data_new$Global_active_power ~ data_new$Datetime, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")

