library(shiny)
library(ggplot2)
ui <- shinyUI(fluidPage(
   
   # Application title
   titlePanel("Earthquake Stats"),
   
   # Sidebar with a slider input for number of bins 

      
      # Show a plot of the generated distribution
      mainPanel(
         plotOutput("distPlot")
      )
   )
)