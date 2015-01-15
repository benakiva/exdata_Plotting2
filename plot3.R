library(ggplot2)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Filter the data for Baltimore
BAData <- NEI[NEI$fips=="24510",]

EmissionsTotals <- aggregate(Emissions ~ year, BAData, FUN=sum)
BAData$year <- factor(BAData$year, levels=c('1999', '2002', '2005', '2008'))

png(filename="./plot3.png", width=800, height=600, units='px')

ggplot(BAData, aes(year, Emissions, fill=type)) +
    geom_bar(stat="identity") +
    theme_bw() + guides(fill=FALSE)+
    facet_grid(.~type,scales = "free",space="free") + 
    labs(x="year", y=expression("Total PM"[2.5]*" Emission (Tons)")) + 
    labs(title=expression("PM"[2.5]*" Emissions per Type in Baltimore City 1999-2008"))

dev.off()
