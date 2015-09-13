# readprep.R
# Exploratory Data Analysis (Sept 2015, exdata-032) - Project 1 
# Script to read and prep the data used for plotting.
# This file will be automatically sourced, if needed, from
#  the plot[1234].R files.
# This file reads the zip file and creates a data frame
#  'edata' with the relevant subset
#  (dates 2007-02-01 and 2007-02-02).
# Input:
# - the current directory should contain the zip file
#     "exdata-data-household_power_consumption.zip"
# Output:
# - creates a dataframe "edata" that has data for the dates
#    2007-02-01 and 2007-02-02
# - converts some columns to numeric so that they can be plotted


# Unzip the file
myfile <- "exdata-data-household_power_consumption.zip"
files_extracted <- unzip(myfile, junkpaths=TRUE, setTimes=TRUE)

# Read the file in. For now keep everything as characters
print("Reading the data file into R. This will take some time...")
rawdata <- read.table("household_power_consumption.txt", header=TRUE,sep=";" , stringsAsFactors=FALSE, colClasses="character")

# create reference date objects to be used for subsetting
refdate_1 <- strptime("01/02/2007", format="%d/%m/%Y")
refdate_2 <- strptime("02/02/2007", format="%d/%m/%Y")

# Process the data
print("Prepping the data for plotting. This will take a few minutes...")
rawdata$Date_obj <- strptime(rawdata$Date, format="%d/%m/%Y")
# now compare and get a mask. This will select rows where the
#  Date is valid and is either "01/02/2007" or "02/02/2007"
isna_mask <- !is.na(rawdata$Date_obj)
date_mask_1 <- rawdata$Date_obj == refdate_1
date_mask_2 <- rawdata$Date_obj == refdate_2
date_mask <- isna_mask & (date_mask_1 | date_mask_2 )

# create subsetted table, "edata"
#
edata <- rawdata[date_mask,]

# create a composite date+time column DT_obj so we can use for plotting
# currently have:
#  $ Date                 : chr  "1/2/2007" "1/2/2007" "1/2/2007" "1/2/2007" ...
#  $ Time                 : chr  "00:00:00" "00:01:00" "00:02:00" "00:03:00" ...
#  $ Date_obj             : POSIXlt, format: "2007-02-01" "2007-02-01" "2007-02-01" ..
datetime <- paste(edata$Date, edata$Time)
edata$DT_obj <- strptime(datetime, format="%d/%m/%Y %H:%M:%S")

# convert other data to numeric so it can be plotted.
# for safety's sake create new columns, don't overwrite
#  the existing data
edata$Global_active_power_n <- as.numeric(edata$Global_active_power)
edata$Global_reactive_power_n <- as.numeric(edata$Global_reactive_power)
edata$Voltage_n <- as.numeric(edata$Voltage)