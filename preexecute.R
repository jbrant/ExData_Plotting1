## This is a helper class that handles downloading the power consumption dataset
## and reading the necessary data associated with the applicable date ranges into
## memory for use by the plotting code.

pre.execute <- function() {
  
  power.consumption.datafile <- "household_power_consumption.txt"
  dataset.url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  dataset.zip <- "powerconsumptiondata.zip"
  
  ## Check if dataset already exists and read in data for date range
  if (file.exists(power.consumption.datafile)) {
    
    ## Read in (already subsetteed) dataset
    power.consumption.data <- read.csv(power.consumption.datafile)
    
    ## Convert DateTime to POSIXlt (otherwise it will be a factor)
    power.consumption.data$DateTime <- strptime(
      paste(power.consumption.data$Date, power.consumption.data$Time), 
      "%d/%m/%Y %H:%M:%S"
    )
  }
  else {
    
    ## If zip file doesn't exist, download it
    if (!file.exists(dataset.zip)) {
      download.file(url=dataset.url, destfile=dataset.zip, mode="wb", quiet=TRUE)
    }
    
    ## Unzip the file
    unzip(zipfile=dataset.zip, overwrite=TRUE, exdir=".")
    
    ## Read in the data (unfiltered as of yet)
    power.consumption.data <- read.table(file=power.consumption.datafile, 
                                         header=TRUE, 
                                         sep=";", 
                                         na.strings="?", 
                                         colClasses=c(
                                           "character", 
                                           "character", 
                                           "numeric", 
                                           "numeric", 
                                           "numeric", 
                                           "numeric", 
                                           "numeric", 
                                           "numeric", 
                                           "numeric"
                                           )
                                         )
    
    ## Subset the data to only February 1 and 2 of 2007
    power.consumption.data <- power.consumption.data[
      power.consumption.data$Date == "1/2/2007" | 
        power.consumption.data$Date == "2/2/2007"
      ,]
    
    ## Convert date and time into Date/Time object
    power.consumption.data$DateTime <- strptime(
      paste(power.consumption.data$Date, power.consumption.data$Time), 
      "%d/%m/%Y %H:%M:%S"
    )
    
    ## Write out subsetted dataset with datetime field back out to CSV
    write.csv(power.consumption.data, power.consumption.datafile)
  }
  
  power.consumption.data
}