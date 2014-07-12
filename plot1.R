setAs("character","myDate", function(from) as.Date(from, format="%d/%m/%Y"))

read_file <- function() {
  df <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?",
                   colClasses=c("Date"="myDate"))
  df <- df[df$Date %in% as.Date(c("2007-02-01", "2007-02-02")),]
  df
}

create_plot <- function(data_frame) {
  png(filename="plot1.png", width=480, height=480)
  with(data_frame, hist(Global_active_power, main="Global Active Power",
                        xlab="Global Active Power (kilowatts)", col="red"))
  dev.off()
}

run_script <- function() {
  create_plot(read_file())
}