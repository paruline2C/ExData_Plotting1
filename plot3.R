# Coursera : Exploratory data analysis - Week 1 - Course Projet 
# Plotting "plot3"

plot3 <- function()
{
  
  # loading datas
  Data<- read.table("D:/DatasScience/RWork/household_power_consumption.txt", header=TRUE, sep=";");
  
  #select only two  days datas
  Data$Date<-as.Date(Data$Date,"%d/%m/%Y");
  DateEnd<- as.Date("2007-02-02")
  DateStart<- as.Date("2007-02-01")
  DataSelect <- subset(Data, Data$Date == DateEnd | Data$Date == DateStart);
  
  #Get the full Date/Time
  DateTime<-strptime( paste(DataSelect$Date,DataSelect$Time),format="%Y-%m-%d %H:%M:%S");
  
  # custom options for plotting 
  par( bg ="white");
   
  #plot datas
  sub1 <- as.numeric(as.character(DataSelect$Sub_metering_1));
  sub2 <- as.numeric(as.character(DataSelect$Sub_metering_2));
  sub3 <- as.numeric(as.character(DataSelect$Sub_metering_3));

  plot(DateTime,sub1, xlab="", ylab="Energy sub metering", type="l");
  lines(DateTime,sub2, col="red", type="l");
  lines(DateTime,sub3, col="blue", type="l");

  legend("topright",col=c("black","red","blue"), lty=c(1,1,1), legend=c("Sub_metering_1","Sub_metering_2","sub_metering_3"))

  # copy to png.
  dev.copy(png, file="plot3.png", width=480, height=480);
  dev.off() # close png device
  
  dev.off() # close windows device.
}