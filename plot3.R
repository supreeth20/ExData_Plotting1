plot3 <- function(){
  library(lubridate)
  data = read.table("data/household_power_consumption.txt",sep=";",header=TRUE)
  timedate = strptime(paste(data$Date,data$Time,sep = " "),"%Y/%m/%d %H:%M:%S")
  data = cbind(data,timedate)
  data$Date = as.Date(data$Date,"%d/%m/%Y")
  data$Time = hms(data$Time)
  dat = data.frame(lapply(data[-c(1,2,dim(data)[1])],function(x){as.numeric(x)}))
  data[,-c(1,2,dim(data)[1])] = dat
  subsetdata = subset(data,Date == "2007-02-01" | Date =="2007-02-02")
  png("plot3.png", width=480, height=480)
  with(subsetdata, plot(timedate, Sub_metering_1, type="l", xlab="Day", ylab="Energy sub metering"))
  lines(subsetdata$timedate, subsetdata$Sub_metering_2,type="l", col= "red")
  lines(subsetdata$timedate, subsetdata$Sub_metering_3,type="l", col= "blue")
  legend(c("topright"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty= 1, lwd=2, col = c("black", "red", "blue"))
  dev.off()
}