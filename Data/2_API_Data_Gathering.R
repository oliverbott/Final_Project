
# Set working directory
setwd('C:/Users/a6p/Desktop/Uni 2014/E1161 - Collaborative Research/GitHub ClonecFinal_Project/Data/')

require("devtools")
library("rsdmx")


# Pull API data from GitHub network
library(httr)
library(dplyr)
library(rjson)


# Pull user numbers of all GitHub users

# Create locations vector
locations <- c('Vienna', 'Graz', 'Linz', 'Brussels', 'Antwerp', 'Ghent', 'Liege', 'Berlin', 'Hamburg', 'Munich', 'Cologne', 'Frankfurt', 'Essen', 'Stuttgart', 'Leipzig', 'Dresden', 'Dortmund', 'Dusseldorf', 'Bremen', 'Hanover', 'Bochum', 'Freiburg', 'Augsburg', 'Bonn', 'Karlsruhe', 'Duisburg', 'Mannheim', 'Aachen', 'Copenhagen', 'Tallinn', 'Madrid', 'Barcelona', 'Valencia', 'Seville', 'Zaragoza', 'Malaga', 'Palmas', 'Bilbao', 'Helsinki', 'Paris', 'Lyon', 'Toulouse', 'Strasbourg', 'Bordeaux', 'Nantes', 'Lille', 'Montpellier', 'Rennes', 'Grenoble', 'Toulon', 'Marseille', 'Nice', 'Rouen', 'Rome', 'Milan', 'Naples', 'Turin', 'Palermo', 'Genova', 'Florence', 'Bari', 'Bologna', 'Catania', 'Venice', 'Mito', 'Tokyo', 'Kofu', 'Nagoya', 'Numazu', 'Osaka', 'Okayama', 'Kurashiki', 'Fukuyama', 'Hiroshima', 'Takamatsu', 'Monterrey', 'Irapuato', 'Hague', 'Amsterdam', 'Rotterdam', 'Utrecht', 'Eindhoven', 'Oslo', 'Lisbon', 'Porto', 'Stockholm', 'Gothenburg', 'Malmo', 'Seattle', 'Portland', 'Minneapolis', 'Milwaukee', 'Madison', 'Buffalo', 'Albany', 'Detroit', 'Boston', 'Chicago', 'Providence', 'Toledo', 'Cleveland', 'Omaha', 'Akron', 'Pittsburgh', 'Harrisburg', 'Philadelphia', 'Columbus', 'Denver', 'Indianapolis', 'Dayton', 'Baltimore', 'Cincinnati', 'Washington', 'Louisville',  'Wichita', 'Richmond', 'Fresno', 'Nashville', 'Tulsa', 'Raleigh', 'Charlotte', 'Albuquerque', 'Memphis', 'Columbia', 'Atlanta', 'Phoenix',  'Dallas', 'Charleston', 'Tucson', 'Austin', 'Jacksonville', 'Houston', 'Orlando', 'Tampa', 'Miami')

# Create empty vector for user counts
user_counts0 <- vector()

# Loop through the locations and download the user counts
## Note: the %23E turns into a greater than sign >
for (i in locations){
  # Download raw data
  URL_temp0 <- paste0('https://api.github.com/search/users?q=location:', i,
                      '+followers:%3E0')
  users0 <- GET(URL_temp0) %>% 
    content(as = 'text') %>% 
    fromJSON()               
  
  # Extract counts of users that meet criteria for the location
  user_counts_temp0 <- users0$total_count
  
  # Add to user_counts vector
  user_counts0 <- c(user_counts0, user_counts_temp0)
  
  # Sleep R for 7 seconds so you don't overload the API
  Sys.sleep(7); message('-')
}

# Combine locations and user counts data
location_counts0 <- data.frame(locations, user_counts0)

# Clean API data
colnames(location_counts0) <- c("METRO_ID" , "zeroFollowers") # Rename columns


# Pull user numbers of GitHub users with over 0 followers

# Create empty vector for user counts
user_counts1 <- vector()

# Loop through the locations and download the user counts
## Note: the %23E turns into a greater than sign >
for (i in locations){
  # Download raw data
  URL_temp1 <- paste0('https://api.github.com/search/users?q=location:', i,
                      '+followers:%3E1')
  users1 <- GET(URL_temp1) %>% 
    content(as = 'text') %>% 
    fromJSON()               
  
  # Extract counts of users that meet criteria for the location
  user_counts_temp1 <- users1$total_count
  
  # Add to user_counts vector
  user_counts1 <- c(user_counts1, user_counts_temp1)
  
  # Sleep R for 7 seconds so you don't overload the API
  Sys.sleep(7); message('-')
}

# Combine locations and user counts data
location_counts1 <- data.frame(locations, user_counts1)


# Clean API data
colnames(location_counts1) <- c("METRO_ID" , "oneFollowers") # Rename columns



# Pull user numbers of GitHub users with over 10 followers

# Create empty vector for user counts
user_counts2 <- vector()

# Loop through the locations and download the user counts
## Note: the %23E turns into a greater than sign >
for (i in locations){
  # Download raw data
  URL_temp2 <- paste0('https://api.github.com/search/users?q=location:', i,
                      '+followers:%3E10')
  users2 <- GET(URL_temp2) %>% 
    content(as = 'text') %>% 
    fromJSON()               
  
  # Extract counts of users that meet criteria for the location
  user_counts_temp2 <- users2$total_count
  
  # Add to user_counts vector
  user_counts2 <- c(user_counts2, user_counts_temp2)
  
  # Sleep R for 7 seconds so you don't overload the API
  Sys.sleep(7); message('-')
}

# Combine locations and user counts data
location_counts2 <- data.frame(locations, user_counts2)


# Clean API data
colnames(location_counts2) <- c("METRO_ID" , "tenFollowers")



# Pull user numbers of GitHub users with over 20 followers

# Create empty vector for user counts
user_counts3 <- vector()

# Loop through the locations and download the user counts
## Note: the %23E turns into a greater than sign >
for (i in locations){
  # Download raw data
  URL_temp3 <- paste0('https://api.github.com/search/users?q=location:', i,
                      '+followers:%3E20')
  users3 <- GET(URL_temp3) %>% 
    content(as = 'text') %>% 
    fromJSON()               
  
  # Extract counts of users that meet criteria for the location
  user_counts_temp3 <- users3$total_count
  
  # Add to user_counts vector
  user_counts3 <- c(user_counts3, user_counts_temp3)
  
  # Sleep R for 7 seconds so you don't overload the API
  Sys.sleep(7); message('-')
}

# Combine locations and user counts data
location_counts3 <- data.frame(locations, user_counts3)


# Clean API data
colnames(location_counts3) <- c("METRO_ID" , "twentyFollowers")



# Pull user numbers of GitHub users with over 30 followers

# Create empty vector for user counts
user_counts4 <- vector()

# Loop through the locations and download the user counts
## Note: the %23E turns into a greater than sign >
for (i in locations){
  # Download raw data
  URL_temp4 <- paste0('https://api.github.com/search/users?q=location:', i,
                      '+followers:%3E30')
  users4 <- GET(URL_temp4) %>% 
    content(as = 'text') %>% 
    fromJSON()               
  
  # Extract counts of users that meet criteria for the location
  user_counts_temp4 <- users4$total_count
  
  # Add to user_counts vector
  user_counts4 <- c(user_counts4, user_counts_temp4)
  
  # Sleep R for 7 seconds so you don't overload the API
  Sys.sleep(7); message('-')
}

# Combine locations and user counts data
location_counts4 <- data.frame(locations, user_counts4)


# Clean API data
colnames(location_counts4) <- c("METRO_ID" , "thirtyFollowers")




# Pull user numbers of GitHub users with over 40 followers

# Create empty vector for user counts
user_counts5 <- vector()

# Loop through the locations and download the user counts
## Note: the %23E turns into a greater than sign >
for (i in locations){
  # Download raw data
  URL_temp5 <- paste0('https://api.github.com/search/users?q=location:', i,
                      '+followers:%3E40')
  users5 <- GET(URL_temp5) %>% 
    content(as = 'text') %>% 
    fromJSON()               
  
  # Extract counts of users that meet criteria for the location
  user_counts_temp5 <- users5$total_count
  
  # Add to user_counts vector
  user_counts5 <- c(user_counts5, user_counts_temp5)
  
  # Sleep R for 7 seconds so you don't overload the API
  Sys.sleep(7); message('-')
}

# Combine locations and user counts data
location_counts5 <- data.frame(locations, user_counts5)


# Clean API data
colnames(location_counts5) <- c("METRO_ID" , "fortyFollowers")


# Pull user numbers of GitHub users with more than 50 followers

# Create locations vector
locations <- c('Vienna', 'Graz', 'Linz', 'Brussels', 'Antwerp', 'Ghent', 'Liege', 'Berlin', 'Hamburg', 'Munich', 'Cologne', 'Frankfurt', 'Essen', 'Stuttgart', 'Leipzig', 'Dresden', 'Dortmund', 'Dusseldorf', 'Bremen', 'Hanover', 'Bochum', 'Freiburg', 'Augsburg', 'Bonn', 'Karlsruhe', 'Duisburg', 'Mannheim', 'Aachen', 'Copenhagen', 'Tallinn', 'Madrid', 'Barcelona', 'Valencia', 'Seville', 'Zaragoza', 'Malaga', 'Palmas', 'Bilbao', 'Helsinki', 'Paris', 'Lyon', 'Toulouse', 'Strasbourg', 'Bordeaux', 'Nantes', 'Lille', 'Montpellier', 'Rennes', 'Grenoble', 'Toulon', 'Marseille', 'Nice', 'Rouen', 'Rome', 'Milan', 'Naples', 'Turin', 'Palermo', 'Genova', 'Florence', 'Bari', 'Bologna', 'Catania', 'Venice', 'Mito', 'Tokyo', 'Kofu', 'Nagoya', 'Numazu', 'Osaka', 'Okayama', 'Kurashiki', 'Fukuyama', 'Hiroshima', 'Takamatsu', 'Monterrey', 'Irapuato', 'Hague', 'Amsterdam', 'Rotterdam', 'Utrecht', 'Eindhoven', 'Oslo', 'Lisbon', 'Porto', 'Stockholm', 'Gothenburg', 'Malmo', 'Seattle', 'Portland', 'Minneapolis', 'Milwaukee', 'Madison', 'Buffalo', 'Albany', 'Detroit', 'Boston', 'Chicago', 'Providence', 'Toledo', 'Cleveland', 'Omaha', 'Akron', 'Pittsburgh', 'Harrisburg', 'Philadelphia', 'Columbus', 'Denver', 'Indianapolis', 'Dayton', 'Baltimore', 'Cincinnati', 'Washington', 'Louisville',  'Wichita', 'Richmond', 'Fresno', 'Nashville', 'Tulsa', 'Raleigh', 'Charlotte', 'Albuquerque', 'Memphis', 'Columbia', 'Atlanta', 'Phoenix',  'Dallas', 'Charleston', 'Tucson', 'Austin', 'Jacksonville', 'Houston', 'Orlando', 'Tampa', 'Miami')

# Create empty vector for user counts
user_counts6 <- vector()

# Loop through the locations and download the user counts
## Note: the %23E turns into a greater than sign >
for (i in locations){
  # Download raw data
  URL_temp6 <- paste0('https://api.github.com/search/users?q=location:', i,
                      '+followers:%3E50')
  users6 <- GET(URL_temp6) %>% 
    content(as = 'text') %>% 
    fromJSON()               
  
  # Extract counts of users that meet criteria for the location
  user_counts_temp6 <- users6$total_count
  
  # Add to user_counts vector
  user_counts6 <- c(user_counts6, user_counts_temp6)
  
  # Sleep R for 7 seconds so you don't overload the API
  Sys.sleep(7); message('-')
}

# Combine locations and user counts data
location_counts6 <- data.frame(locations, user_counts6)

# Clean API data
colnames(location_counts6) <- c("METRO_ID" , "fiftyFollowers") # Rename columns


# Pull user numbers of GitHub users with over 60 followers

# Create empty vector for user counts
user_counts7 <- vector()

# Loop through the locations and download the user counts
## Note: the %23E turns into a greater than sign >
for (i in locations){
  # Download raw data
  URL_temp7 <- paste0('https://api.github.com/search/users?q=location:', i,
                      '+followers:%3E60')
  users7 <- GET(URL_temp7) %>% 
    content(as = 'text') %>% 
    fromJSON()               
  
  # Extract counts of users that meet criteria for the location
  user_counts_temp7 <- users7$total_count
  
  # Add to user_counts vector
  user_counts7 <- c(user_counts7, user_counts_temp7)
  
  # Sleep R for 7 seconds so you don't overload the API
  Sys.sleep(7); message('-')
}

# Combine locations and user counts data
location_counts7 <- data.frame(locations, user_counts7)


# Clean API data
colnames(location_counts7) <- c("METRO_ID" , "sixtyFollowers") # Rename columns



# Pull user numbers of GitHub users with over 70 followers

# Create empty vector for user counts
user_counts8 <- vector()

# Loop through the locations and download the user counts
## Note: the %23E turns into a greater than sign >
for (i in locations){
  # Download raw data
  URL_temp8 <- paste0('https://api.github.com/search/users?q=location:', i,
                      '+followers:%3E70')
  users8 <- GET(URL_temp8) %>% 
    content(as = 'text') %>% 
    fromJSON()               
  
  # Extract counts of users that meet criteria for the location
  user_counts_temp8 <- users8$total_count
  
  # Add to user_counts vector
  user_counts8 <- c(user_counts8, user_counts_temp8)
  
  # Sleep R for 7 seconds so you don't overload the API
  Sys.sleep(7); message('-')
}

# Combine locations and user counts data
location_counts8 <- data.frame(locations, user_counts8)


# Clean API data
colnames(location_counts8) <- c("METRO_ID" , "seventyFollowers")



# Pull user numbers of GitHub users with over 80 followers

# Create empty vector for user counts
user_counts9 <- vector()

# Loop through the locations and download the user counts
## Note: the %23E turns into a greater than sign >
for (i in locations){
  # Download raw data
  URL_temp9 <- paste0('https://api.github.com/search/users?q=location:', i,
                      '+followers:%3E80')
  users9 <- GET(URL_temp9) %>% 
    content(as = 'text') %>% 
    fromJSON()               
  
  # Extract counts of users that meet criteria for the location
  user_counts_temp9 <- users9$total_count
  
  # Add to user_counts vector
  user_counts9 <- c(user_counts9, user_counts_temp9)
  
  # Sleep R for 7 seconds so you don't overload the API
  Sys.sleep(7); message('-')
}

# Combine locations and user counts data
location_counts9 <- data.frame(locations, user_counts9)


# Clean API data
colnames(location_counts9) <- c("METRO_ID" , "eightyFollowers")



# Pull user numbers of GitHub users with over 90 followers

# Create empty vector for user counts
user_counts10 <- vector()

# Loop through the locations and download the user counts
## Note: the %23E turns into a greater than sign >
for (i in locations){
  # Download raw data
  URL_temp10 <- paste0('https://api.github.com/search/users?q=location:', i,
                       '+followers:%3E90')
  users10 <- GET(URL_temp10) %>% 
    content(as = 'text') %>% 
    fromJSON()               
  
  # Extract counts of users that meet criteria for the location
  user_counts_temp10 <- users10$total_count
  
  # Add to user_counts vector
  user_counts10 <- c(user_counts10, user_counts_temp10)
  
  # Sleep R for 7 seconds so you don't overload the API
  Sys.sleep(7); message('-')
}

# Combine locations and user counts data
location_counts10 <- data.frame(locations, user_counts10)


# Clean API data
colnames(location_counts10) <- c("METRO_ID" , "ninetyFollowers")




# Pull user numbers of GitHub users with over 100 followers

# Create empty vector for user counts
user_counts11 <- vector()

# Loop through the locations and download the user counts
## Note: the %23E turns into a greater than sign >
for (i in locations){
  # Download raw data
  URL_temp11 <- paste0('https://api.github.com/search/users?q=location:', i,
                       '+followers:%3E100')
  users11 <- GET(URL_temp11) %>% 
    content(as = 'text') %>% 
    fromJSON()               
  
  # Extract counts of users that meet criteria for the location
  user_counts_temp11 <- users11$total_count
  
  # Add to user_counts vector
  user_counts11 <- c(user_counts11, user_counts_temp11)
  
  # Sleep R for 7 seconds so you don't overload the API
  Sys.sleep(7); message('-')
}

# Combine locations and user counts data
location_counts11 <- data.frame(locations, user_counts11)

# Clean API data
colnames(location_counts11) <- c("METRO_ID" , "hundredFollowers")


# Merge different follower number dataframes
location_countsA <- merge(location_counts0 , location_counts1 , by=c("METRO_ID"))
location_countsB <- merge(location_countsA , location_counts2 , by=c("METRO_ID"))
location_countsC <- merge(location_countsB , location_counts3 , by=c("METRO_ID"))
location_countsD <- merge(location_countsC , location_counts4 , by=c("METRO_ID"))
location_countsE <- merge(location_countsD , location_counts5 , by=c("METRO_ID"))
location_countsF <- merge(location_counts6 , location_counts7 , by=c("METRO_ID"))
location_countsG <- merge(location_countsF , location_counts8 , by=c("METRO_ID"))
location_countsH <- merge(location_countsG , location_counts9 , by=c("METRO_ID"))
location_countsI <- merge(location_countsH , location_counts10 , by=c("METRO_ID"))
api <- merge(location_countsH , location_counts11 , by=c("METRO_ID"))

# Save as .csv
write.csv(api, file = "GitHub_API.csv")