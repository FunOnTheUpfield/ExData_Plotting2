# plot1.R
# Script 1 of 4 in repo https://github.com/FunOnTheUpfield/ExData_Plotting2
# Prepared as part of https://class.coursera.org/exdata-012/
# By Simon Stainsby
# Written 9 - 15 March 2015

# Plot PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Beware, the number of monitoring stations changes over time and not every station reports data.
# Remove rows where a monitoring stations that did not report data one year
NEI <- NEI[complete.cases(NEI), ]

# fips | 1999| 2002emissions | 2005emissions | 2008emissions

emissions1999 <- NEI[NEI$year == '1999', c('fips', 'Emissions')]
names(emissions1999) <- c("fips", "1999")
emissions2002 <- NEI[NEI$year == '2002', c('fips', 'Emissions')]
names(emissions2002) <- c("fips", "2002")
emissions2005 <- NEI[NEI$year == '2005', c('fips', 'Emissions')]
names(emissions2005) <- c("fips", "2005")
emissions2008 <- NEI[NEI$year == '2008', c('fips', 'Emissions')]
names(emissions2008) <- c("fips", "2008")

nationalemissions <- cbind(emissions1999, emissions2002, emissions2005, emissions2008)

library(tidyr)
gather(nationalemissions, fips)