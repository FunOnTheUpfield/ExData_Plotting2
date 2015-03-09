# plot1.R
# Script 1 of 4 in repo https://github.com/FunOnTheUpfield/ExData_Plotting2
# Prepared as part of https://class.coursera.org/exdata-012/
# By Simon Stainsby
# Written 9 - 15 March 2015

# Plot PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# We are interested in total emissions at each site, for each year.
library(dplyr)

totalemissions <- NEI %>%
  group_by(fips,year) %>%
  summarize(total_PM25 =sum(Emissions))

#plot(totalemissions$year, log(totalemissions$total_PM25), 
#     main = 'Changes in fine air pollutant levels over time' , 
#     xlab = 'Year', ylab = expression('Log Total ' * PM[25]))

# That graph doesn't give a very clear idea of the changes over time

boxplot(log(total_PM25) ~ year, data=totalemissions, 
        main ='Changes in fine particulate air pollution levels over time', 
        xlab = 'Year', ylab = expression('Log Total ' * PM[25]))

