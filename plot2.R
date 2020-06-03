plot2 <- function(){
  library(lubridate)
  data = read.table("data/household_power_consumption.txt",sep=";",header=TRUE)
  timedate = strptime(paste(data$Date,data$Time,sep = " "),"%Y/%m/%d %H:%M:%S")
  data$Date = as.Date(data$Date,"%d/%m/%Y")
  data$Time = hms(data$Time)
  dat = data.frame(lapply(data[-c(1,2,dim(data)[1])],function(x){as.numeric(x)}))
  data[,-c(1,2)] = dat
  data = subset(data,Date == "2007-02-01" | Date =="2007-02-02")
  png('plot2.png',width=480,height=480)
  plot(data$timedate,data$Global_active_power,type='l',xlab="Day", ylab="Global Active Power (kilowatts)")
  dev.off()
}