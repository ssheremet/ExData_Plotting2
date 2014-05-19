plot2 <- function(){
       
       ##read data from file
       NEI <- readRDS("summarySCC_PM25.rds")
       
       ##filter data by fips
       dataFips <- NEI[NEI$fips == "24510",]
       
       ##aggregate data by years and set dim names
       data <- aggregate(dataFips$Emissions, by=list(dataFips$year), FUN=sum)
       colnames(data) <- c("year","Emissions")
       
       ##draw line diagram
       plot(data$year, data$Emissions, type="l", xlab="Year", ylab="Emissions", main="Emissions by years in Baltimore", xaxt="n", col="steelblue")
       
       ##set x-axis
       axis(1, at=data$year, labels=c("1999", "2002", "2005", "2008"))
       
       ##draw diagram frame
       box()       
       
       ##copy diagram to png file
       dev.copy(png, filename="plot2.png", width = 480, height = 480, units = "px")
       dev.off()
}