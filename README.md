# ExData_Plotting2
Exploratory Data Analysis Course Project 2 - Airbourne Particuticulate Matter analysis


The scripts plot1.R through plot4.R make graphs analysing the 
 [United States] Environmental Protection Agency National Emissions Inventory (NEI)
 http://www.epa.gov/ttn/chief/eiinformation.html

 Original data downloaded: 9 March 2015 from
 https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip


*plot1* uses the base package to depict total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008. This graph should help answer the question: "Have total emissions of PM2.5 decreased in the United States from 1999 to 2008?"

It shows an overlall reduction of PM2.5 polution levels. 


*plot2* uses the base package to depict total emissions of PM2.5 at Baltimore City, Maryland (fips == "24510") in the years  1999 to 2008.  This graph shoulud help answer the question "Have emissions of PM2.5 decreased in Baltimore City, Maryland?"

It shows an overlall reduction of PM2.5 pollution levels in Baltimore.


*plot3* uses ggplot2 package to depict emissions recorded at the Baltimore monitoring site broken down by emission source type (point, nonpoint, onroad, nonroad). This graph should help answer the question:
"Which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City?"

It shows small reductions in point, on-road and non-road pollutions sources, and no real change to the non-point sources.


*plot4* depicts emissions from coal combustion related sources across all monitoring stations across the United States.  This graph should help answer the question:
" Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?""

How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?


*plot5* Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles County, California (fips == "06037"). Which city has seen greater changes over time in motor vehicle emissions?