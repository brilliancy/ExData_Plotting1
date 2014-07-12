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
#plot1
hist(dataE$Global_active_power, col= "red",main="Global Active Power", xlab="Global Active Power(kilowatts)")