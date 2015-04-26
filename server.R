#  Shiny application exemplifying model clustering on the Iris dataset
#
# Reference: 
#  Chris Fraley, Adrian E. Raftery, T. Brendan Murphy, and Luca Scrucca (2012) mclust Version 4 for R: Normal Mixture Modeling for
#  Model-Based Clustering, Classification, and Density Estimation Technical Report No. 597, Department of Statistics, University of
#  Washington
#
#  Chris Fraley and Adrian E. Raftery (2002) Model-based Clustering, Discriminant Analysis and Density Estimation Journal of the
#  American Statistical Association 97:611-631
#
# Start the appplication in the current working directory with
# 		runApp()
# or start it in a subfoder
# 		runApp("/path/to/folder")
#

#pckg = c("mclust", "gridExtra") 
#is.installed <- function(mypkg){ is.element(mypkg, installed.packages()[,1]) } 
#for(i in 1:length(pckg)) { if (!is.installed(pckg[i])) { install.packages(pckg[i]) } }

library(mclust)

shinyServer(function(input, output, session) {

  # Combine the selected variables into a new data frame
  selectedData <- reactive({
    iris[, c(input$xcol, input$ycol)]
  })

  clusters <- reactive({
    Mclust(selectedData(), modelNames=input$model)
  })

  output$plotClusters <- renderPlot({
    plot(clusters(), what='classification')
    #plot(selectedData(),
    #     col = clusters()$cluster,	
    #     pch = 20, cex = 3)
    #points(clusters()$centers, pch = 4, cex = 4, lwd = 4)
  })
})
