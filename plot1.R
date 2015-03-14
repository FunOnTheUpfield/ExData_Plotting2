# plot1.R
# Script 1 of 5 in repo https://github.com/FunOnTheUpfield/ExData_Plotting2
# Prepared as part of https://class.coursera.org/exdata-012/
# By Simon Stainsby
# Written 9 - 15 March 2015

# This plot uses the base package to depict total PM2.5 emission from all sources 
# for each of the years 1999, 2002, 2005, and 2008. 
# This graph should help answer the question: 
# "Have total emissions of PM2.5 decreased in the United States from 1999 to 2008?"

NEI <- readRDS("summarySCC_PM25.rds")

# We are interested in total emissions at each site, for each year.
library(dplyr)

totalemissions <- NEI %>%
  group_by(fips,year) %>%
  summarize(total_PM25 =sum(Emissions))


#plot(totalemissions$year, log(totalemissions$total_PM25), 
#     main = 'Changes in fine air pollutant levels' , 
#     xlab = 'Year', ylab = expression('Log Total ' * PM[25]))

# The scatterplot doesn't give a very clear idea of the changes over time



png(file = 'plot1.png', width = 480, height = 480, units = "px")

boxplot(log(total_PM25) ~ year, data=totalemissions, 
        main ='Changes in United States fine particulate air pollution levels over time', 
        xlab = 'Year', ylab = expression('Log Total ' * PM[25]))

dev.off()

# This plot depicts all sites - not just the ones that have been there for all survey years.
# The addition of new sites might affect the 'whole of survey' outcome
# Especially if the new survey sites are in less polluted survey areas than the old survey sites.
# To eliminate that potential problem, we should only be looking at 
# the subset of sites that are included in each survey year.  
# (I haven't done that - because the question asks to plot ALL sites).

