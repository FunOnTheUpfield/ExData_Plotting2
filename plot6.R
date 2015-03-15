# plot6.R
# Script 6 of 6 in repo https://github.com/FunOnTheUpfield/ExData_Plotting2
# Prepared as part of https://class.coursera.org/exdata-012/
# By Simon Stainsby
# Written 9 - 15 March 2015

# This plot Compare emissions from motor vehicle sources in Baltimore City 
# with emissions from motor vehicle sources in Los Angeles County, California
# To answer the question
# "Which city has seen greater changes over time in motor vehicle emissions?"

# Baltimore (fips == "24510")
# Los Angeles (fips == "06037")

# --------------------
# I have chosen "Emissions from Motor Vehicle Sources" to include
# Emissions from Highway Vehicle Use  (i.e. all SCS that include "Highway Veh")

# I have excluded emissions from motor vehicle manufacture and maintenance
# and emissions from the transport, storage and sale of motor vehicle fuels.

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


# Extract find the emissions types related to Motor Vehicle use
highwayvehicles <- SCC[grep("Highway Veh", SCC$Short.Name) , c('SCC','Short.Name')]

# extract emissions observations from baltimore and Los Angeles
baltimore <- NEI[NEI$fips == "24510", ]
losangeles <- NEI[NEI$fips == "06037", ]
cities <- rbind(baltimore, losangeles)

library(ggplot2)
cityvehicles <- cities[highwayvehicles$SCC %in% cities$SCC, ]

# convert fips numbers to city names
cityvehicles$fips[cityvehicles$fips == "24510"] <- "Baltimore"
cityvehicles$fips[cityvehicles$fips == "06037"] <- "Los Angeles"



png(file = 'plot6.png', width = 480, height = 480, units = "px")
f <- ggplot(cityvehicles, aes(year , Emissions)) + geom_point() + ylim(0,1000) + geom_smooth(aes(group=1), method="lm", se=FALSE) + facet_wrap(~fips) + ggtitle("Air pollution from motor vehicles")
print(f)
dev.off()
