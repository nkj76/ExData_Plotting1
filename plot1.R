# plot1.R
# Exploratory Data Analysis (Sept 2015, exdata-032) - Project 1
# Script to create plot 1

# This file needs to be source()'d to create plot1.
# Output is a file "plot1.png" in the current directory.
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
png(filename="plot1.png", height=480, width=480)

# do the plotting
hist(edata$Global_active_power_n,col="red", main="Global Active Power", ylab="Frequency", xlab="Global Active Power (kilowatts)")

# close the device
dev.off()