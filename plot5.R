plot5 <- function(){
       
       require(ggplot2)
       
       ##read data from files
       NEI <- readRDS("summarySCC_PM25.rds")
       SCC <- readRDS("Source_Classification_Code.rds")
       
       ##subsetting data by coal combustion
       NEI_motor <- subset(NEI,type=="ON-ROAD" & fips == "24510")
       
       ##aggregate data by years and set dim names
       data <- aggregate(NEI_motor$Emissions, by=list(NEI_motor$year), FUN=sum)
       colnames(data) <- c("Year","Emissions")
       
       ##create plot objiect
       g <- ggplot(data, aes(Year, Emissions))
       
       ##add layers and print plot
       g + geom_point(shape=2, color="steelblue") + geom_line(col="steelblue") + ggtitle("Emission of motor vehicle in Baltimore by years") + theme_bw() + scale_x_continuous(breaks=c(1999, 2002, 2005, 2008))
       
       ##copy diagram to png file
       dev.copy(png, filename="plot5.png", width = 480, height = 480, units = "px")
       dev.off()
}