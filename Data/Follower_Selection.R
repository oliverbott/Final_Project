# Set working directory
setwd('C:/Users/...')

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

colnames(dataset) <- c("METRO_ID" , "1" , "10" , "20" , "30", "40", "50", "60", "70", "80", "90", "100" , "US" , "DE" , "FR" , "JP")


#### Our approach so far - not great####

  #install.packages("dplyr")
  #install.packages("reshape2")
  library(dplyr)
  library(reshape2)

  follow <- dataset

  follow$US <- NULL
  follow$DE <- NULL
  follow$FR <- NULL
  follow$JP <- NULL

  # Turn dataframe horizontally
  follow <- melt(follow)
  head(follow)

  colnames(follow) <- c("METRO_ID" , "Variable" , "Value")

  follow[,"Value"] <- as.numeric(follow[,"Value"])
  follow[,"Variable"] <- as.numeric(follow[,"Variable"])

  follow <- group_by(follow, Variable)
  A1 <- summarize (follow, sum(Value))
  colnames(A1) <- c("Variable" , "Value")

  # The barplot - very basic (have not been able to add Variable info)
  barplot(A1$Value, main="Follower Distribution", 
          xlab="Follower number categories")


