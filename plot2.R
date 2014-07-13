source("preexecute.R")

## Run all necessary steps of downloading data and loading it into memory
dataset <- pre.execute()

## Open the file device
png(filename="plot2.png", width=480, height=480, units="px")

## Render the line plot
plot(dataset$DateTime, dataset$Global_active_power, type="l", xlab="", ylab="Global Active Power (killowats)")

## Close the file device
dev.off()