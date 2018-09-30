# Coursera : Exploratory data analysis - Week 1 - Course Projet 
# Plotting "plot1"

plot1 <- function()
{

  # loading datas
  Data<- read.table("D:/DatasScience/RWork/household_power_consumption.txt", header=TRUE, sep=";");
  
  Data$Date<-as.Date(Data$Date,"%d/%m/%Y");
  
  #select only two  days
  DateEnd<- as.Date("2007-02-02")
  DateStart<- as.Date("2007-02-01")
  DataSelect <- subset(Data, Data$Date == DateEnd | Data$Date == DateStart);
  
  # custom options for plotting 
  par( bg ="white");
  
  #Open widow
  windows();
  
  #plot datas
  hist(as.numeric(DataSelect$Global_active_power), col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power", breaks=15);

   # copy to png.
  dev.copy(png, file="plot1.png", width=480, height=480);
  dev.off() # close png device
  
  dev.off() # close windows device.
}