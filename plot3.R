source("preexecute.R")

## Run all necessary steps of downloading data and loading it into memory
dataset <- pre.execute()

## Open the file device
png(filename="plot3.png", width=480, height=480, units="px")

## Plot all sub metering lines
plot(dataset$DateTime, dataset$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(dataset$DateTime, dataset$Sub_metering_2, col="red")
lines(dataset$DateTime, dataset$Sub_metering_3, col="blue")

## Add the legend
legend(
  "topright", 
  legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
  col=c("black","red","blue"), 
  lty=1, 
  lwd=1
)

## Close the file device
dev.off()