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

# Coal related emissions
coal <- [SCC$Short.Name[grepl('[C|c]oal ', SCC$Short.Name)]