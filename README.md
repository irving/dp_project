# Data Products Project Documentation #

## Purpose ##

This document explains the State-by-State Crimes app developed for part one of the final project for the Coursera Developing Data Products class.

## Location ##

A live version of this project can be found at https://dpirv.shinyapps.io/dp_project/.

### Instructions ###

This application displays crime incident stats for each of the U.S. states (plus the district of Columbia) from 1960 until 2010. (Except for the state of NY which has no data for 1960 to 1964).

The crimes included are the most serious of what is known as "index crimes." These are crimes tracked by the FBI. This application shows numbers for murder, forcible rape, aggravated assault and robbery (stealing with force).

1. Select a state from the drop down list marked "Select a state"
1.1 This is the state whose crime stats you want to see. The application opens with Alabama to show you what to expect.
2. Optionally you may select one or more crimes by checking the check boxes below the label "Select crime(s)" as required. If no crime is selected, the resluting plot will show them all.
3. Click the button labeled "Show state plot."
4. The application will show a year by year graph of the selected crime(s) for the selected state and some summary statistics below.
5. Repeat as desired. That's it!

## Source ##

The information used to create these plots was obtained from the U.S. Federal Bureau of Investigation at http://www.ucrdatatool.gov/Search/Crime/State/RunCrimeStatebyState.cfm

Starting from the above referenced page, select the following:

1. From the left box, select all states (hold the shift key)
2. In the middle box select "number of violent crimes"
3. In the right hand box select all the years from 1960 until 2012
4. Click "get table"
5. On the resulting page there is a link to download the csv.
6. Preparation of the csv was done with a script included in the project repository at https://github.com/irving/dp_project.
