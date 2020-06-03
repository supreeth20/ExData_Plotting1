plot1<- function(){
  library(lubridate)
  data = read.table("data/household_power_consumption.txt",sep=";",header=TRUE)
  data$Date = as.Date(data$Date,"%d/%m/%Y")
  data$Time = hms(data$Time)
  dat = data.frame(lapply(data[-c(1,2)],function(x){as.numeric(x)}))
  data[,-c(1,2)] = dat
  data = subset(data,Date == "2007-02-01" | Date =="2007-02-02")
  png('plot1.png',width=480,height=480)
  hist(data$Global_active_power,main="Global Active Power",col='red')
  dev.off()
}