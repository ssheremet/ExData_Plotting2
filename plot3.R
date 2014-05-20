plot3 <- function(){
       
       require(ggplot2)
       
       ##read data from file
       NEI <- readRDS("summarySCC_PM25.rds")
       
       ##filter data by fips (get data for Baltimore)
       dataFips <- NEI[NEI$fips == "24510",]
       
       ##aggregate data by years and set dim names
       data <- aggregate(dataFips$Emissions, by=list(dataFips$year, dataFips$type), FUN=sum)
       colnames(data) <- c("Year", "Type", "Emissions")
       
       ##create plot objiect
       g <- ggplot(data, aes(Year, Emissions))
       
       ##add layers and print plot
       g + geom_point(shape=2, color="steelblue") + geom_line(col="steelblue") + facet_grid(Type ~ .) + ggtitle("Emission by type in Baltimore") + theme_bw()
       
       ##copy diagram to png file
       dev.copy(png, filename="plot3.png", width = 480, height = 480, units = "px")
       dev.off()
}