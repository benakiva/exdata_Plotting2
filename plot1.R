NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

EmissionsTotals <- aggregate(Emissions ~ year, NEI, FUN=sum)

barplot(round(EmissionsTotals[,2]/1000,2), names.arg=EmissionsTotals$year,
        xlab="Year",
        ylab="PM2.5 Emissions in Kilo Tons)",
        main="Total PM2.5 Emissions from All Sources in the US")

dev.copy(png, file = "./plot1.png", width = 560, height = 480)
dev.off()
