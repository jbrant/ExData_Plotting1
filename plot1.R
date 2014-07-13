source("preexecute.R")

## Run all necessary steps of downloading data and loading it into memory
dataset <- pre.execute()

## Open the file device
png(filename="plot1.png", width=480, height=480, units="px")

## Render the histogram
hist(dataset$Global_active_power, main = "Global Active Power", xlab="Global Active Power (kilowatts)", col = "red")

## Close the file device
dev.off()