# plot1.R
# Script 4 of 5 in repo https://github.com/FunOnTheUpfield/ExData_Plotting2
# Prepared as part of https://class.coursera.org/exdata-012/
# By Simon Stainsby
# Written 9 - 15 March 2015

# This depicts emissions from coal combustion related sources 
# across all monitoring stations across the United States.  
# This graph should help answer the question:
# "Across the United States, how have emissions from coal 
#  combustion-related sources changed from 1999–2008?"


NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Find emissions categories related to Coal
coal <- SCC[SCC$Short.Name[grepl('[C|c]oal ', SCC$Short.Name)], c('SCC','Short.Name')]

# Coal related pollution observations
coalpollution <- NEI[NEI$SCC %in% coal$SCC, ]

library(dplyr)

totalecoalemissions <- coalpollution %>%
  group_by(fips,year) %>%
  summarize(total_PM25 =sum(Emissions))


png(file = 'plot4.png', width = 480, height = 480, units = "px")

boxplot(log(total_PM25) ~ year, data=totalecoalemissions, 
        main ='Changes in United States air pollution levels /n from coal related sources', 
        xlab = 'Year', ylab = expression('Log Total ' * PM[25]))

#boring
# Also how is it possible to have negative emissions values?

dev.off()
