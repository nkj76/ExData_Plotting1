# plot2.R 

# Exploratory Data Analysis (Sept 2015, exdata-032) - Project 1
# Script to create plot 2

# This file needs to be source()'d to create plot2.
# Output is a file "plot2.png" in the current directory.
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
png(filename="plot2.png", height=480, width=480)

# do the plotting
plot(edata$DT_obj, edata$Global_active_power_n, type="l", xlab="", ylab="Global Active Power (kilowatts)")

# close the device
dev.off()