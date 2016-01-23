This is a minimal working version of the project

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Violent crimes in the US"),
  
  sidebarLayout(
    
    sidebarPanel(
      
      
      selectInput("state", "Select a US state:", 
                  choices = state_names),
      
      checkboxGroupInput("crimes", "Select a crime:",
                         c("all", "murder", "rape", "aggravated assault", "robbery" )),
      
      submitButton("Show Plot")
      
    ),
    
    mainPanel(
      plotOutput("crime_plot")
    )
  )
))