# plot2.R
# Script 2 of 6 in repo https://github.com/FunOnTheUpfield/ExData_Plotting2
# Prepared as part of https://class.coursera.org/exdata-012/
# By Simon Stainsby
# Written 9 - 15 March 2015

# *plot2* uses the base package to depict total emissions 
# of PM2.5 at Baltimore City, Maryland (fips == "24510") in the years  1999 to 2008.
# This graph shoulud help answer the question:
# "Have emissions of PM2.5 decreased in Baltimore City, Maryland?"

NEI <- readRDS("summarySCC_PM25.rds")

baltimore <- NEI[NEI$fips == "24510", ]
rm(NEI)

library(dplyr)

totalemissions <- baltimore %>%
  group_by(year) %>%
  summarize(total_PM25 =sum(Emissions))

png(file = 'plot2.png', width = 480, height = 480, units = "px")

plot(totalemissions$year, totalemissions$total_PM25, type = 'l', 
     main = 'Fine particulate air pollution levels \n in Baltimore, Maryland', 
     xlab = "", ylab = expression('Total ' * PM[25]), ylim = c(0, 3500))

dev.off()
