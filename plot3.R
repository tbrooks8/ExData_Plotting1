setAs("character","myDate", function(from) as.Date(from, format="%d/%m/%Y"))

read_file <- function() {
  df <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?",
                   colClasses=c("Date"="myDate"))
  df <- df[df$Date %in% as.Date(c("2007-02-01", "2007-02-02")),]
  df
}