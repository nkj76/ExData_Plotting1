# plot3.R 

# Exploratory Data Analysis (Sept 2015, exdata-032) - Project 1
# Script to create plot 3

# This file needs to be source()'d to create plot3.
# Output is a file "plot3.png" in the current directory.
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
png(filename="plot3.png", height=480, width=480)

# do the plotting
plot(edata$DT_obj, edata$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(edata$DT_obj, edata$Sub_metering_2, col="red")
lines(edata$DT_obj, edata$Sub_metering_3, col="blue")
legend("topright", lty=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# close the device
dev.off()