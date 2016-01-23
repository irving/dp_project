library(shiny)
library(reshape2)
library(ggplot2)
library(plotly)

get_state_data <- function(state_name){
  c <- read.csv(paste("./states_data/", state_name, sep=""))
  c2 <- c[,c(1, 4, 5, 6, 7)]
  c2$year <- as.factor(c2$year)
  melt(c2, id.vars="year", value.name="incidents", variable.name="crime")
}

make_plot <- function(df, name){
  years <- seq(1960, 2010, 5)
  ggplot(data=df, aes(x=year, y=incidents, group=crime, color=crime)) +
    geom_line(size=0.5) +
    geom_point( size=1, shape=21, fill="blue") +
    ggtitle(name) + 
    theme(plot.title = element_text(lineheight=.8, face="bold")) +
        scale_x_discrete(name="year", breaks = years, labels=as.character(years)) +
        theme(axis.title.x = element_text(size=0.5, face="bold", vjust=0.3)) +
        theme(axis.text.x = element_text(size=0.6)) + 
        theme(axis.title.y = element_text(size=0.5, face="bold"))
}

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  observe({
    state <-input$state
    data <- get_state_data(state)
    crimes <- input$crimes
    if (length(crimes) == 0)
        crimes <- crime_names

    data2 = subset(data, data$crime %in% crimes)
    #output$crimea <- renderPrint(summary(data2$amount))
    # NOTE: The graph is not yet interactive. 
    # It should show only the crime or crimes selected!
    output$crime_plot <- renderPlotly(make_plot(data2, state))
  })
  
})