# Set working directory
setwd('C:/Users/a6p/Desktop/Uni 2014/E1161 - Collaborative Research/GitHub Clone/Final_Project/Data/')

#install.packages("RCurl")
library(RCurl)

# Load .csv from GitHub repository
options(RCurlOptions = list(cainfo = system.file("CurlSSL", "cacert.pem", package = "RCurl")))

# Create dynamic link to Dataset.csv created through the Data_Gathering.R
x <- getURL('https://raw.githubusercontent.com/oliverbott/Final_Project/master/Data/Dataset.csv')
dataset <- read.csv(text = x)

# For this task we get rid of the other variables
dataset$X <- NULL
dataset$Patents <- NULL
dataset$GDP <- NULL
dataset$Population <- NULL
dataset$Pollution <- NULL
dataset$Greenspace <- NULL
dataset$Employment <- NULL
dataset$lon <- NULL
dataset$lat <- NULL
dataset$zeroFollowers <- NULL

# Rename variables for melting
colnames(dataset) <- c("METRO_ID" , "1" , "10" , "20" , "30", "40", "50", 
                       "60", "70", "80", "90", "100" , "US" , "DE" , "FR" , "JP")
  # 1 means 1-9 followers, 10 equals 10-19 followers etc.

# Use country dummies to group cities
  #install.packages("dplyr")
  #install.packages("reshape2")
  library(dplyr)
  library(reshape2)

attach(dataset)
aggdata <-aggregate(dataset, by=list(US, DE, FR, JP), 
                    FUN=mean, na.rm=TRUE)
aggdata$US <- NULL
aggdata$DE <- NULL
aggdata$FR <- NULL
aggdata$JP <- NULL

country <- c("Other", "US", "DE", "FR", "JP")
aggdata <- data.frame(country, aggdata)

aggdata$Group.1 <- NULL
aggdata$Group.2 <- NULL
aggdata$Group.3 <- NULL
aggdata$Group.4 <- NULL
aggdata$METRO_ID <- NULL

colnames(aggdata) <- c("Country" , "1" , "10" , "20" , "30", "40", "50", 
                       "60", "70", "80", "90", "100")

print(aggdata)
detach(dataset)

# Turn dataframe horizontally
aggdata <- melt(aggdata)
head(aggdata)

# Very basic bar graph for all country averages added
library(ggplot2)
ggplot(data=aggdata, aes(x=variable, y=value)) + geom_bar(stat="identity")


# rCharts interactive plot
  #install.packages("rCharts")
library(rCharts)

n1 <- nPlot(value ~ variable, group = "Country", 
            data = aggdata, type = "multiBarChart")
n1$print("chart3")

# How to show this in R/browser/presentation?
n1$show('iframesrc', cdn = TRUE)



