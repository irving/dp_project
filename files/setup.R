# This file takes the data downloaded from 
# http://www.ucrdatatool.gov/Search/Crime/State/RunCrimeStatebyState.cfm 
# reads in the Excel file and outputs a single file per state contained therein.

csv <- read.csv("CrimeStatebyState.csv", header=FALSE, skip=6)
setwd("states_data")
# now we have to figure out how to get the good data that is here

# each state has a name and a start and end point. 
# unfortunately, these need to be compiled by hand
# subtract 6 from each of the numbers
states <- c("Alabama", "Alaska", "Arizona", "Arkansas", "California", "Colorado", 
        "Connecticut", "Delaware", "District of Columbia", "Florida", "Georgia", "Hawaii", "Idaho", 
        "Illinois", "Indiana", "Iowa", "Kansas", "Kentucky", "Louisiana", 
        "Maine", "Maryland", "Massachusetts", "Michigan", "Minnesota", 
        "Mississippi", "Missouri", "Montana", "Nebraska", "Nevada", 
        "New Hampshire", "New Jersey", "New Mexico", "New York", "North Carolina", 
        "North Dakota", "Ohio", "Oklahoma", "Oregon", "Pennsylvania", "Rhode Island", 
        "South Carolina", "South Dakota", "Tennessee", "Texas", "Utah", "Vermont", 
        "Virginia", "Washington", "West Virginia", "Wisconsin", "Wyoming")
# add 57 to each number to find the start of the next state
# 52 to get the end of the current state
# New York doesn't have data for 1960 to 1965!
# Compensate for that when the time comes

# This is a lot of trouble to go to.
# but all I'm going to have people do is put in a state and a year 
# For the year they will get the aggregate
# and a graph of the ...
# this seems too disconnected. Show the state in relation to the national rate?
# That may actually work.

# get the data for each state and create a csv to output for it.
#Let's try doing just one first.

columns <- c('year', 'population', 'total', 'murder', 'rape', 'robbery', 'aggravated assault')
row <- 1
increment <- 50

for (i in 1:51){
    # pull the information for each state from the spreadsheet and make a separate file
    # Then those files can be pulled in to the presentation rather simply
    stop_place <- row + increment
    if (states[i] =="New York")
        stop_place <- stop_place - 5 # because NY is short 5 years of data
    
    #print(paste("starting at row ", row + 6, " and stopping at row ", stop_place + 6))
    grid <- csv[c(row:stop_place),c(1:7)] # filtering out empty column
    colnames(grid) <- columns
    row <- stop_place + 5
    
    fname <- gsub(" ", "_", states[i])
    write.csv(grid, fname, row.names=FALSE)
}

# remember when reading these to use the strip white option
#c <- read.csv("Alaska", strip.white = TRUE)

setwd("..") 
