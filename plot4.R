# Function to crete the plot # 4 as part of the first project for the
# Exploratory Data Analysis course
createPlot4<-function(targetDataSet,plotLocation){
  # Fetch the data
  targetDataSubset <- loadDataSubset(targetDataSet)
  # Proceed to print the plot
  plotDataSubset(targetDataSubset,paste(plotLocation,"plot4.png",sep = "\\"))
  
}

# Method to load the actual data subset from the file
loadDataSubset<-function(targetDataSetFile){
  # Fetch exactly the number of required rows after the date match to cover the 2 days that are required  
  resultTable <- read.table(targetDataSetFile,skip = grep("^31/1/2007;23:59:00",readLines(targetDataSetFile)),nrows=2880,sep = ";",
                            col.names = c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  resultTable
}

# Method to generate the plot
plotDataSubset<-function(targetData,targetPlotFile){
  print(paste("Creating plot file at",targetPlotFile))
  par(bg="white",mfrow=c(2,2))
  # GAP plot
  plot(targetData$Global_active_power,ylab = "Global Active Power",xlab = NA,xaxt="n",type = "l")
  axis(1,at=c(1,1440,2880),labels = c("Thu","Fri","Sat"))
  # Voltage plot
  plot(targetData$Voltage,ylab = "Voltage",xlab = "datetime",xaxt="n",type = "l")
  axis(1,at=c(1,1440,2880),labels = c("Thu","Fri","Sat"))
  # Sub metering plot
  plot(targetData$Sub_metering_1,ylab = "Energy sub metering",xaxt="n",type = "l",xlab = NA)
  lines(targetData$Sub_metering_2,type = "l",col="red")
  lines(targetData$Sub_metering_3,type = "l",col="blue")
  axis(1,at=c(1,1440,2880),labels = c("Thu","Fri","Sat"))
  legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty = 1,col = c("black","red","blue"),bty = "n")
  #Global reactive power plot
  plot(targetData$Global_reactive_power,ylab = "Global_reactive_power",xlab = "datetime",xaxt="n",type = "l")
  axis(1,at=c(1,1440,2880),labels = c("Thu","Fri","Sat"))
  
  dev.copy(png,file = targetPlotFile)
  dev.off()
  print("Plot created.")
}