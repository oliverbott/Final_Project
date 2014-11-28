

# Set working directory
setwd('C:/Users/a6p/Desktop/Uni 2014/E1161 - Collaborative Research/GitHub Clone/Final_Project/Data/')

# Install and load package RCurl
install.packages("RCurl")
library(RCurl)

options(RCurlOptions = list(cainfo = system.file("CurlSSL", "cacert.pem", package = "RCurl")))

# Create dynamic link to Dataset.csv created through the Data_Gathering.R
x <- getURL('https://raw.githubusercontent.com/oliverbott/Final_Project/master/Data/Dataset.csv')
dataset2 <- read.csv(text = x)

dataset2$X <- NULL # Get rid of extra column

# Add dummy variables

dummyframe <- data.frame (dataset2$METRO_ID, US=c(0), DE=c(0), FR=c(0), JP=c(0))

colnames(dummyframe) <- c("METRO_ID" , "US" , "DE" , "FR" , "JP")



# You can find the city names in order in the Data_Gathering_Final.Rmd (the renaming part)

# US replace 0 by 1
dummyframe$US[dummyframe$METRO_ID %in% "Houston"] <- "1"
dummyframe$US[dummyframe$METRO_ID %in% "NAMEofCITY"] <- "1"
#... copy code and add all cities

# Germany replace 0 by 1
dummyframe$DE[dummyframe$METRO_ID %in% "NAMEofCITY"] <- "1"

# France replace 0 by 1
dummyframe$FR[dummyframe$METRO_ID %in% "NAMEofCITY"] <- "1"

# Japan replace 0 by 1
dummyframe$JP[dummyframe$METRO_ID %in% "NAMEofCITY"] <- "1"



# Merge 

datasetdummy <- merge(dataset2 , dummyframe , by=c("METRO_ID")) 

# Save as .csv

write.csv(dataset, file = "datasetdummy.csv")
# Sync and done.

