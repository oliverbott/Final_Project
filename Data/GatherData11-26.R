# Set working directory
setwd('C:/Users/a6p/Desktop/Uni 2014/E1161 - Collaborative Research/GitHub Clone/Final_Project')

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
  Sys.sleep(2); message('-')
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
  Sys.sleep(2); message('-')
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
  Sys.sleep(2); message('-')
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
  Sys.sleep(2); message('-')
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
  Sys.sleep(2); message('-')
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
  Sys.sleep(2); message('-')
}

# Combine locations and user counts data
location_counts5 <- data.frame(locations, user_counts5)


# Clean API data
colnames(location_counts5) <- c("METRO_ID" , "fortyFollowers")


# Merge different follower number dataframes
location_countsA <- merge(location_counts0 , location_counts1 , by=c("METRO_ID"))
location_countsB <- merge(location_countsA , location_counts2 , by=c("METRO_ID"))
location_countsC <- merge(location_countsB , location_counts3 , by=c("METRO_ID"))
location_counts <- merge(location_countsC , location_counts4 , by=c("METRO_ID"))
     
     
# Save dataframe as .csv file to save computing time
write.csv(dataset, file = "Gathering0-40.csv")