#data is already in working directory
data <- read.table("household_power_consumption.txt", sep=";" , header=TRUE, stringsAsFactor=FALSE)
#combining a new data and time column
datet<-paste(data$Date,data$Time)
datet<-strptime(datet, "%d/%m/%Y %H:%M:%S")
#coverting to right class
data$Global_active_power<-as.numeric(data$Global_active_power)
data$Global_reactive_power<-as.numeric(data$Global_reactive_power)
data$Voltage<-as.numeric(data$Voltage)
data$Global_intensity <- as.numeric(data$Global_intensity)
data$Sub_metering_1<- as.numeric(data$Sub_metering_1)
data$Sub_metering_2<- as.numeric(data$Sub_metering_2)
#adding new date time column
names(datet)<- datet
dataC<-cbind(data,datet)
#cleaning class
dataD<-na.omit(dataC)
#subsetting dates
dataE<-dataD[with(dataD, Date=="1/2/2007"|Date=="2/2/2007"), ]
#plot4
par(mfrow=c(2,2))
#plot 4.1
with(dataE, plot(datet,Global_active_power,type="l",ylab= "Global Active Power(kilowatts)",xlab= " "))
#plot 4.2
with(dataE, plot(datet,Voltage, type="l",ylab="Voltage",xlab="datetime"))
#plot 4.3
with(dataE, plot(datet,Sub_metering_1, type="l", xlab="",ylab= "Energy sub metering"))
with(dataE, lines(datet,Sub_metering_2, type="l",col="red"))
with(dataE, lines(datet,Sub_metering_3, type="l",col="blue"))
with(dataE, plot(datet,Global_reactive_power, type="l", ylab="Global_reactive_power", xlab="datetime"))
