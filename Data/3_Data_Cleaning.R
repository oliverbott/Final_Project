
# Set working directory
setwd('C:/Users/a6p/Desktop/Uni 2014/E1161 - Collaborative Research/GitHub ClonecFinal_Project/Data/')

# Merge all OECD and API data set
datasetpre <- merge(oecd , location_counts , by=c("METRO_ID"))                 

# Change total counts into counts per population
datasetpre$nofollowing <- datasetpre$nofollowing/datasetpre$Population
datasetpre$nofollowing <- datasetpre$nofollowing*10000

datasetpre$medfollowing <- datasetpre$medfollowing/datasetpre$Population
datasetpre$medfollowing <- datasetpre$medfollowing*10000

datasetpre$hifollowing <- datasetpre$hifollowing/datasetpre$Population
datasetpre$hifollowing <- datasetpre$hifollowing*10000