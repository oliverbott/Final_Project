
# Set working directory
setwd('C:/Users/a6p/Desktop/Uni 2014/E1161 - Collaborative Research/GitHub Clone/Final_Project/Data/')

options(RCurlOptions = list(cainfo = system.file("CurlSSL", "cacert.pem", package = "RCurl")))

# Create dynamic link to Dataset.csv created through the Data_Gathering.R
x <- getURL('https://raw.githubusercontent.com/oliverbott/Final_Project/master/Data/Gathering0-40.csv')
gather0to40 <- read.csv(text = x)

y <- getURL('https://raw.githubusercontent.com/oliverbott/Final_Project/master/Data/Gathering50-100.csv')
gather50to100 <- read.csv(text = y)




# Change follower numbers into categories

dataset$oneFollowers <- dataset$zeroFollowers-dataset$tenFollowers # 1-9 followers
dataset$tenFollowers <- dataset$tenFollowers-dataset$twentyFollowers # 10-19 followers
dataset$twentyFollowers <- dataset$twentyFollowers-dataset$thirtyFollowers # 20-29 followers
dataset$thirtyFollowers <- dataset$thirtyFollowers-dataset$fortyFollowers # 30-39 followers
dataset$fortyFollowers <- dataset$fortyFollowers-dataset$fiftyFollowers # 40-49 followers
dataset$fiftyFollowers <- dataset$fiftyFollowers-dataset$sixtyFollowers # 50-59 followers
dataset$sixtyFollowers <- dataset$sixtyFollowers-dataset$seventyFollowers # 60-69 followers
dataset$seventyFollowers <- dataset$seventyFollowers-dataset$eightyFollowers # 70-79 followers
dataset$eightyFollowers <- dataset$eightyFollowers-dataset$ninetyFollowers # 80-89 followers
dataset$ninetyFollowers <- dataset$ninetyFollowers-dataset$hundredFollowers # 90-99 followers

# Merge OECD with GitHub API datasets

dataset <- merge(oecd2 , api , by=c("METRO_ID"))

write.csv(dataset, file = "dataset.csv")