setAs("character","myDate", function(from) as.Date(from, format="%d/%m/%Y"))

read_file <- function() {
  df <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?",
                   colClasses=c("Date"="myDate"))
  df <- df[df$Date %in% as.Date(c("2007-02-01", "2007-02-02")),]
  df
}

create_plot <- function(data_frame) {
  png(filename="plot4.png", width=480, height=480)
  midpoint <- sum(data_frame$Date == as.Date("2007-02-01"))
  par(mfrow=c(2, 2))
  with(data_frame, plot.ts(Global_active_power, main="", xlab="",
                           ylab="Global Active Power", axes=F))
  axis(2)
  axis(1, at=c(0, 1440, length(data_frame$Date)), labels=c("Thu", "Fri", "Sat"))
  box()
  with(data_frame, plot.ts(Voltage, main="", xlab="datetime", ylab="Voltage",
                          axes=F))
  axis(2)
  axis(1, at=c(0, 1440, length(data_frame$Date)), labels=c("Thu", "Fri", "Sat"))
  box()
  plot.ts(data_frame[, c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")], plot.type="single", main="", xlab="",
          ylab="Energy sub metering", axes=F, col=c("black", "red", "blue"))
  axis(2)
  axis(1, at=c(0, 1440, length(data_frame$Date)), labels=c("Thu", "Fri", "Sat"))
  box()
  legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
         lwd = 1, col=c("black", "red", "blue"), bty="n")
  with(data_frame, plot.ts(Global_reactive_power, main="", xlab="datetime",
                           ylab="Global_reactive_power", axes=F))
  axis(2)
  axis(1, at=c(0, 1440, length(data_frame$Date)), labels=c("Thu", "Fri", "Sat"))
  box()
  dev.off()
}

run_script <- function() {
  create_plot(read_file())
}