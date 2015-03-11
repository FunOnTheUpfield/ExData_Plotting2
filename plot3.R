# plot3.R
# Script 3 of 4 in repo https://github.com/FunOnTheUpfield/ExData_Plotting2
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

g <- ggplot(baltimore, aes(y= log(Emissions), x= year) + geom_boxplot() + facet_wrap(~type) + labs(title = "Baltimore Air Pollution by emission source type"))
# I'm a big fan of the box plot 

print(g)
dev.off()

# m <- ggplot(baltimore, aes(year , Emissions)) + geom_point() + facet_wrap(~type) + geom_smooth(aes(group=1), method="lm", se=FALSE) + ggtitle("Baltimore Air Pollution by emission source type")
#print(m)
# This works, but breaks when I attempt to convert y into log(Emissions)
