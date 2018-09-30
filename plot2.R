# Coursera : Exploratory data analysis - Week 1 - Course Projet 
# Plotting "plot2"

plot2 <- function()
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
  
  #Open widow
  windows();
  
  #plot datas
  globalActivePower <- as.numeric(as.character(DataSelect$Global_active_power));
  plot(DateTime,globalActivePower,xlab="", ylab="Global Active Power (kilowatts)", type="l");
  
  # copy to png.
  dev.copy(png, file="plot2.png", width=480, height=480);
  dev.off() # close png device
  
  dev.off() # close windows device.
}