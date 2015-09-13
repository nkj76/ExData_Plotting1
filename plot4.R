# plot4.R 

# Exploratory Data Analysis (Sept 2015, exdata-032) - Project 1
# Script to create plot 4

# This file needs to be source()'d to create plot4.
# Output is a file "plot4.png" in the current directory.
# This will automatically source the file "readprep.R" if the
#  has not yet been read into R.

# if 'edata' does not exist, read the data in and prep it.
if (!exists("edata"))
{
  if (!file.exists("readprep.R"))
  {
    print("ERROR: cannot access file ./readprep.R to read and prep the data")
  } else
  {
    source("readprep.R")
  }
}

# create the output device
png(filename="plot4.png", height=480, width=480)
par(mfrow=c(2,2))  # set 2 by 2 

# do the plotting
# sub-plot 1
plot(edata$DT_obj, edata$Global_active_power_n, type="l", xlab="", ylab="Global Active Power (kilowatts)")

# sub-plot 2
plot(edata$DT_obj, edata$Voltage_n, type="l", xlab="datetime", ylab="Voltage")

# sub-plot 3
plot(edata$DT_obj, edata$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(edata$DT_obj, edata$Sub_metering_2, col="red")
lines(edata$DT_obj, edata$Sub_metering_3, col="blue")
legend("topright", lty=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# sub-plot4
plot(edata$DT_obj, edata$Global_reactive_power_n, type="l", xlab="datetime", ylab="Global_reactive_power")

# close the device
dev.off()
