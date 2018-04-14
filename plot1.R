# Function to crete the plot # 1 as part of the first project for the
# Exploratory Data Analysis course
createPlot1<-function(targetDataSet,plotLocation){
  # Fetch the data
  targetDataSubset <- loadDataSubset(targetDataSet)
  # Proceed to print the plot
  plotDataSubset(targetDataSubset,paste(plotLocation,"plot1.png",sep = "\\"))
  
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
  hist(targetData$Global_active_power,main = "Global Active Power",col = "red",xlab = "Global Active Power (kilowatts)")
  dev.copy(png,file = targetPlotFile)
  dev.off()
  print("Plot created.")
}