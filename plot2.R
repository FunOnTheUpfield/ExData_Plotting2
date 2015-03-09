# plot2.R
# Script 2 of 4 in repo https://github.com/FunOnTheUpfield/ExData_Plotting2
# Prepared as part of https://class.coursera.org/exdata-012/
# By Simon Stainsby
# Written 9 - 15 March 2015

# *plot2* depicts total emissions of PM2.5 at Baltimore City, Maryland in the years  1999 to 2008
# This graph should help answer the question have emissions of PM2.5 decreased in Baltimore? 

NEI <- readRDS("summarySCC_PM25.rds")

baltimore <- NEI[NEI$fips == "24510", ]
rm(NEI)

totalemissions <- baltimore %>%
  group_by(year) %>%
  summarize(total_PM25 =sum(Emissions))

plot(totalemissions$year, totalemissions$total_PM25, type = 'l', 
     main = 'Fine particulate air pollution levels \n in Baltimore, Maryland', 
     xlab = "", ylab = expression('Total ' * PM[25]), ylim = c(0, 3500))
