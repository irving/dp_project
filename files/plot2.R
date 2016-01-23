library(shiny)
library(reshape2)
library(ggplot2)
library(plotly)

get_state_data <- function(state_name){
  c <- read.csv(paste("./states_data/", state_name, sep=""))
  c2 <- c[,c(1, 4, 5, 6, 7)]
  c2$year <- as.factor(c2$year)
  melt(c2, id.vars="year", value.name="amount", variable.name="crime")
}

make_plot <- function(df){
  ggplot(data=df, aes(x=year, y=amount, group=crime, color=crime)) +
    geom_line() +
    geom_point( size=1, shape=21, fill="blue")
}

d <- get_state_data("Alabama")
q <- ggplotly(make_plot(d))