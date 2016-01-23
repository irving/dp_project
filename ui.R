library(shiny)
library(plotly)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

  # Application title
  titlePanel("Violent crimes in the US"),

  fluidRow(
    column(6, offset = 2,
       selectInput("state", "Select a US state:", 
                   choices = state_names),
       
       checkboxGroupInput("crimes", "Select crime(s):", inline = TRUE,
                          crime_names),
       p(em("For convenience, if no crimes are selected, the plot will show them all.")),
       
       submitButton("Show State Plot")     
    )
  ),
  
  plotlyOutput("crime_plot")     
))