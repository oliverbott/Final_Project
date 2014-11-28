
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



# Reshape city and follower data

follow <- dataset

follow$Patents <- NULL
follow$GDP <- NULL
follow$Population <- NULL
follow$Pollution <- NULL
follow$Greenspace <- NULL
follow$Employment <- NULL
follow$lon <- NULL
follow$lat <- NULL

colnames(follow) <- c("METRO_ID" , "0" , "10" , "20" , "30", "40", "50", "60", "70", "80", "90", "100" , "110")



# Melt into long format
follow <- melt(follow)
head(follow)

colnames(follow) <- c("METRO_ID" , "Variable" , "Value") # Rename columns

follow[,"Value"] <- as.numeric(follow[,"Value"])

follow <- group_by(follow, Variable)
ob1 <- summarize (follow, sum(Value))


# Histogram

qplot(follow$Value, binwidth=1)
qplot(ob1$Value, binwidth=10)

hist(ob1$Value)


colnames(ob1) <- c("Variable" , "Value")
qplot(ob1$Variable)

barplot(ob1$Value, main="Follower Distribution", 
        xlab="Follower number categories")


# Then break it down by city

group_by(follow, METRO_ID, Variable)


followcast <- cast(follow)
head(follow)


#################### Second attempt - doesnt work

follow <- dataset

follow$Patents <- NULL
follow$GDP <- NULL
follow$Population <- NULL
follow$Pollution <- NULL
follow$Greenspace <- NULL
follow$Employment <- NULL
follow$lon <- NULL
follow$lat <- NULL

colnames(follow) <- c("METRO_ID" , ">0" , "1-9" , "10-19" , "20-29", "30-39", "40-49", "50-59", "50-69", "70-79", "80-89", "90-99" , ">100")

follow <- melt(follow)
head(follow)

colnames(follow) <- c("METRO_ID" , "Variable" , "Value") # Rename columns

follow <- group_by(follow, Variable)


#################### Third attempt - rCharts

hair_eye_male <- subset(as.data.frame(HairEyeColor), Sex == "Male")
n1 <- nPlot(Freq ~ Hair, group = "Eye", data = hair_eye_male, type = "multiBarChart")
n1$print("chart3")


