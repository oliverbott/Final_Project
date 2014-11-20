
library(ggmap)

 places <- c('Vienna', 'Graz', 'Linz', 'Brussels', 'Antwerp', 'Ghent', 'Liege', 'Berlin', 'Hamburg', 'Munich', 'Cologne', 'Frankfurt', 'Essen', 'Stuttgart', 'Leipzig', 'Dresden', 'Dortmund', 'Dusseldorf', 'Bremen', 'Hanover', 'Bochum', 'Freiburg', 'Augsburg', 'Bonn', 'Karlsruhe', 'Duisburg', 'Mannheim', 'Aachen', 'Copenhagen', 'Tallinn', 'Madrid', 'Barcelona', 'Valencia', 'Seville', 'Zaragoza', 'Malaga', 'Palmas', 'Bilbao', 'Helsinki', 'Paris', 'Lyon', 'Toulouse', 'Strasbourg', 'Bordeaux', 'Nantes', 'Lille', 'Montpellier', 'Rennes', 'Grenoble', 'Toulon', 'Marseille', 'Nice', 'Rouen', 'Rome', 'Milan', 'Naples', 'Turin', 'Palermo', 'Genova', 'Florence', 'Bari', 'Bologna', 'Catania', 'Venice', 'Mito', 'Tokyo', 'Kofu', 'Nagoya', 'Numazu', 'Osaka', 'Okayama', 'Kurashiki', 'Fukuyama', 'Hiroshima', 'Takamatsu', 'Monterrey', 'Irapuato', 'Hague', 'Amsterdam', 'Rotterdam', 'Utrecht', 'Eindhoven', 'Oslo', 'Lisbon', 'Porto', 'Stockholm', 'Gothenburg', 'Malmo', 'Seattle', 'Portland', 'Minneapolis', 'Milwaukee', 'Madison', 'Buffalo', 'Albany', 'Detroit', 'Boston', 'Chicago', 'Providence', 'Toledo', 'Cleveland', 'Omaha', 'Akron', 'Pittsburgh', 'Harrisburg', 'Philadelphia', 'Columbus', 'Denver', 'Indianapolis', 'Dayton', 'Baltimore', 'Cincinnati', 'Washington', 'Louisville',  'Wichita', 'Richmond', 'Fresno', 'Nashville', 'Tulsa', 'Raleigh', 'Charlotte', 'Albuquerque', 'Memphis', 'Columbia', 'Atlanta', 'Phoenix',  'Dallas', 'Charleston', 'Tucson', 'Austin', 'Jacksonville', 'Houston', 'Orlando', 'Tampa', 'Miami')

location <- geocode(places)

location2 <- data.frame(location, places)

colnames(location2) <- c("lon" , "lat" , "METRO_ID") # Rename columns

datasetmain <- merge(dataset , location2 , by=c("METRO_ID")) # Merge location vectors with main data set




