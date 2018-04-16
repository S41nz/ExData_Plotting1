# Function to crete the plot # 2 as part of the first project for the
# Exploratory Data Analysis course
createPlot2<-function(targetDataSet,plotLocation){
  # Fetch the data
  targetDataSubset <- loadDataSubset(targetDataSet)
  # Proceed to print the plot
  plotDataSubset(targetDataSubset,paste(plotLocation,"plot2.png",sep = "\\"))
  
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
  par(bg="white")
  plot(targetData$Time,targetData$Global_active_power,ylab = "Global Active Power (kilowatts)",xaxt="n")
  axis(1,at=c(1,720,1440),labels = c("Thu","Fri","Sat"))
  #lines(targetData$Time,targetData$Global_active_power)
  dev.copy(png,file = targetPlotFile)
  dev.off()
  print("Plot created.")
}