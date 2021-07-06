# Assignment: DSC640 - Final Milestone 2
# Name: Brehm, David
# Date: 2021-07-03

library(readxl)
library(ggplot2)
library(tidyr)

# Read data.
df1 <- read_excel('D:\\School\\640\\Data\\Final\\US Airline Traffic Data.xlsx')
df2 <- read_excel('D:\\School\\640\\Data\\Final\\United Airlines Quarterly Revenue.xlsx')

# Convert airline traffic data to long and add a date column.
df1_long <- df1 %>% gather(Year, Value, -c(Month))
df1_long$Date <- as.Date(with(df1_long, paste(Year, Month, 1, sep='-')), '%Y-%B-%d')

# The date in the quarterly revenue file is read as date-time. Convert to date.
df2$Date <- as.Date(df2$Date)


# Line plot - US Airline Traffic
ggplot(df1_long, aes(x=Date, y=Value)) + geom_line(color='blue') + ylab('US Airlines Passengers (Million)') + 
  ggtitle('US Airline Traffic')

# Bar chart - United Airlines Quarterly Revenue
ggplot(df2, aes(x=Date, y=Revenue)) + geom_bar(stat='identity',fill="#238c22", width=70) + ylab('Revenue (Millions of US $)') + 
  ggtitle('United Airlines Quarterly Revenue') + theme_minimal()