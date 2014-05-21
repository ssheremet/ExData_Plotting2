plot6 <- function(){
       
       ##read data from files
       NEI <- readRDS("summarySCC_PM25.rds")
       SCC <- readRDS("Source_Classification_Code.rds")
       
       ##subsetting data by coal combustion
       NEI_motor <- subset(NEI,type=="ON-ROAD" & (fips == "24510" | fips == "06037"))
       
       ##aggregate data by years and set dim names
       data <- aggregate(NEI_motor$Emissions, by=list(NEI_motor$year, NEI_motor$fips), FUN=sum)
       colnames(data) <- c("Year", "City", "Emissions")
       
       ##create datasets for plotting
       dataLA <- subset(data, City=="06037", select=c("Year", "Emissions"))
       dataBaltimore <- subset(data, City=="24510", select=c("Year", "Emissions"))
       
       png(filename="plot6.png", width = 480, height = 480, units = "px")
       
       ##draw plot with Baltimore data
       plot(dataBaltimore$Year, dataBaltimore$Emissions, type="l", xaxt="n", ylim=c(0, max(max(dataLA$Emissions), max(dataBaltimore$Emissions))), col="steelblue", ylab="Emission", xlab="Year", main="Motor vehicle emissions in LA and Baltimore", panel.first=grid(equilogs=FALSE))
       
       ##set x-axis
       axis(1, at=dataLA$Year, labels=c("1999", "2002", "2005", "2008"))
              
       ##add LA data on plot
       lines(dataLA$Year, dataLA$Emissions, type="l", col="indianred")
       
       ##make some beauty
       points(dataLA$Year, dataLA$Emissions, pch=2, col="indianred")
       points(dataBaltimore$Year, dataBaltimore$Emissions, pch=2, col="steelblue")
       
       ##add legend
       legend("right", c("Los Angeles","Baltimore"), lty=c(1,1), col=c("indianred","steelblue"))
       
       ##close device       
       dev.off()       
       
}