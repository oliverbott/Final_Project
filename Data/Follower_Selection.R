
# Set working directory
setwd('C:/Users/a6p/Desktop/Uni 2014/E1161 - Collaborative Research/GitHub Clone/Final_Project/Test files/')

library(RCurl)
library(ggmap)
library(maptools)
library(dplyr)
library(reshape2)
library(maps)
library(stargazer)
library(rCharts)

# Load .csv from GitHub repository
options(RCurlOptions = list(cainfo = system.file("CurlSSL", "cacert.pem", package = "RCurl")))

# Create dynamic link to Dataset.csv created through the Data_Gathering.R
x <- getURL('https://raw.githubusercontent.com/oliverbott/Final_Project/9c08cb04289524812f7f2a94a00bd5d89b7fa7de/Data/Dataset.csv')
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

new <- dataset
new_2 <- reshape(new, 
                 varying = c("US", "DE", "FR", "JP"), 
                 v.names = "value",
                 timevar = "Country", 
                 times = c("US", "DE", "FR", "JP"), 
                 new.row.names = 1:1000,
                 direction = "long")

new_2 <- subset(new_2, value>0)
new_2$id <- NULL 
new_2$value <- NULL
new_2$Country <- as.factor(new_2$Country)
x_2 <- split(new_2, new_2$Country)
x_3 <- lapply(x_2, function (x) sapply(x, mean))
x_3 <- data.frame(x_3)
x_3 <- na.omit(x_3)

df <- reshape(x_3, 
                 varying = c("US", "DE", "FR", "JP"), 
                 v.names = "value",
                 timevar = "Country", 
                 times = c("US", "DE", "FR", "JP"), 
                 new.row.names = 1:1000,
                 direction = "long")
variable <- c(1,10,20,30,40,50,60,70,80,90,100, 
              1,10,20,30,40,50,60,70,80,90,100,
              1,10,20,30,40,50,60,70,80,90,100,
              1,10,20,30,40,50,60,70,80,90,100)
df <- data.frame(df, variable)
df$id <- NULL 
df$variable <- as.factor(df$variable)

# Set color scheme
library(RColorBrewer)
myColours <- brewer.pal(6,"Set3")

my.settings <- list(
  superpose.polygon=list(col=myColours[3:6], border="transparent"),
  strip.background=list(col=myColours[6]),
  strip.border=list(col="black")
)

require(lattice)
barchart(value ~ variable, groups=Country, df, auto.key = list(columns = 4), 
         main="Follower counts in different countries", xlab="Follower category", 
         ylab="Frequency", par.settings = my.settings, scales=list(alternating=1),
         uto.key=list(space="top", columns=4, 
                      points=FALSE, rectangles=TRUE,
                      title="District", cex.title=1),
         par.strip.text=list(col="white", font=2),)
