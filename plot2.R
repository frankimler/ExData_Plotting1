# Coursera
# John Hopkins University Data Science Specialization
# Exploratory Data Analysis - Week 1 Project 1
# Frank C. Imler

# Loads Library
library("data.table")

# Reads in Household Power Consumption Data
gap <- data.table::fread(input = "household_power_consumption.txt", na.strings="?")

# Stops Scientific Notation
gap[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]

# Allows a POSIXct Date to be Filtered/Plotted by Time of Day
gap[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]

# Filters Dates
gap <- gap[(dateTime >= "2007-02-01") & (dateTime < "2007-02-03")]

# Sets Plot Size
png("plot2.png", width=480, height=480)

# Creates Plot 2
plot(x = gap[, dateTime]
     , y = gap[, Global_active_power]
     , type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()