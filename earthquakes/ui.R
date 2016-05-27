myData <- read.csv("/home/ubuntu/quakes.csv")


shinyUI(pageWithSidebar(
  headerPanel('Assignment6- k-means clustering'),
  
  sidebarPanel(
    selectInput('xcol', 'X Variable', names(myData)),
    selectInput('ycol', 'Y Variable', names(myData),
                selected=names(myData)[[2]]),
    numericInput('clusters', 'Cluster count', 3,
                 min = 1, max = 9),
    checkboxInput('header', 'No of Clusters', FALSE)      # Initially set to FALSE
  ),
  mainPanel(
    plotOutput('plot1')
  )
))

