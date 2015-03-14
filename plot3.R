# plot3.R
# Script 3 of 5 in repo https://github.com/FunOnTheUpfield/ExData_Plotting2
# Prepared as part of https://class.coursera.org/exdata-012/
# By Simon Stainsby
# Written 9 - 15 March 2015

# *plot3* uses ggplot2 package to depict emissions recorded at the Baltimore monitoring site
# broken down by emission source type (point, nonpoint, onroad, nonroad).  
# This graph should help answer the question:
# "Which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City?" 


NEI <- readRDS("summarySCC_PM25.rds")

baltimore <- NEI[NEI$fips == "24510", ]
rm(NEI)

baltimore$year <- factor(baltimore$year)
baltimore$type <- factor(baltimore$type)
library(ggplot2)

png(file = 'plot3.png', width = 480, height = 480, units = "px")
 m <- ggplot(baltimore, aes(year , Emissions)) + geom_point() + ylim(0,400) + facet_wrap(~type) + geom_smooth(aes(group=1), method="lm", se=FALSE) + ggtitle("Baltimore Air Pollution by emission source type")
print(m)
dev.off()

