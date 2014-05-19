plot1 <- function(){
       
       ##read data from file
       NEI <- readRDS("summarySCC_PM25.rds")
       
       ##aggregate data by years and set dim names
       data <- aggregate(NEI$Emissions, by=list(NEI$year), FUN=sum)
       colnames(data) <- c("year","Emissions")
       
       ##draw line diagram
       plot(data$year, data1$Emissions/1000000, type="l", xlab="Year", ylab="Emissions", main="Total emissions by years", axes=FALSE, col="steelblue")
       
       ##set x-axis
       axis(1, at=data$year, labels=c("1999", "2002", "2005", "2008"))
       
       ##set y-axis
       pts<-pretty(data1$Emissions/1000000)
       axis(2, at = pts, labels = paste(pts, "M", sep = ""))
       
       ##draw diagram frame
       box()
       
       ##copy diagram to png file
       dev.copy(png, filename="plot1.png", width = 480, height = 480, units = "px")
       dev.off()
       
       
}