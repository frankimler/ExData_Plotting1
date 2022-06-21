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

# Converts Date & Time Variables to Date/Time classes
gap[, Date := lapply(.SD, as.Date, "%d/%m/%Y"), .SDcols = c("Date")]

# Filters Dates
gap <- gap[(Date >= "2007-02-01") & (Date <= "2007-02-02")]

# Sets Plot Size
png("plot1.png", width=480, height=480)

# Creates Plot 1
hist(gap[, Global_active_power], main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

dev.off()