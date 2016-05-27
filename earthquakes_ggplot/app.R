#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)
# Define UI for application that draws a histogram
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

# Define server logic required to draw a histogram
server <- shinyServer(function(input, output) {
  
  output$distPlot <- renderPlot({
    # generate bins based on input$bins from ui.R
    # myData <- read.csv("C:\\Users\\Admin\\Desktop\\R-kmeans\\clustering\\earthquakes.csv")
    myData <- read.csv("/home/ubuntu/earthquakes.csv")
    
    newdata <-myData[which(myData$magType == "mb" & myData$mag>0 & myData$mag<100),]
    clusterabc <- kmeans(newdata[,c(4,5)],3)
    clusterabc
    x <- tapply(newdata$depth,clusterabc$cluster,mean)
    y <-tapply(newdata$mag,clusterabc$cluster,mean)
    kcenter <- data.frame(x,y)
    clustercategory <- as.factor(clusterabc$cluster)
    clustercenter <- as.factor(clusterabc$centers)
    ggplot(newdata,aes(depth,mag,color=clustercategory)) + geom_point() + geom_point(data=kcenter,aes(x,y),pch=8,size=10, colour=1:3)
  })
})

# Run the application 
shinyApp(ui = ui, server = server)

