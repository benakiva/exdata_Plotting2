NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Filter the data for Baltimore
BAData <- NEI[NEI$fips=="24510",]

EmissionsTotals <- aggregate(Emissions ~ year, BAData, FUN=sum)

barplot(round(EmissionsTotals[,2]/1000,2), names.arg=EmissionsTotals$year,
        xlab="Year",
        ylab="PM2.5 Emissions in Kilo Tons)",
        main="Total PM2.5 Emissions from All Sources in Baltimore")

dev.copy(png, file = "./plot2.png", width = 560, height = 480)
dev.off()
