source("preexecute.R")

## Run all necessary steps of downloading data and loading it into memory
dataset <- pre.execute()

## Open the file device
png(filename="plot4.png", width=480, height=480, units="px")

## Layout the plotting area with 2 rows and 2 columns (4 plots)
par (mfrow=c(2,2), mar=c(4,4,2,1))

## Plot the top left line graph
plot(dataset$DateTime, dataset$Global_active_power, type="l", xlab="", ylab="Global Active Power (killowats)")

## Plot the top right line graph
plot(dataset$DateTime, dataset$Voltage, type="l", xlab="datetime", ylab="Voltage")

## Plot the bottom left line graph
plot(dataset$DateTime, dataset$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(dataset$DateTime, dataset$Sub_metering_2, col="red")
lines(dataset$DateTime, dataset$Sub_metering_3, col="blue")

## Add the legend (to bottom left line graph)
legend(
  "topright", 
  legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
  col=c("black","red","blue"), 
  lty=1, 
  lwd=1,
  bty="n"
)

## Plot the bottom right line graph
plot(dataset$DateTime, dataset$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

## Close the file device
dev.off()