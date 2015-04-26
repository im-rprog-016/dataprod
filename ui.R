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

shinyUI(pageWithSidebar(
  headerPanel('Model Clustering on Iris dataset'),
  sidebarPanel(
    h4("Select the variables on which to perform the clustering and the Clustering model"),
    selectInput('xcol', 'X Variable', names(iris), selected=names(iris)[[3]]),
    selectInput('ycol', 'Y Variable', names(iris), selected=names(iris)[[4]]),
    selectInput('model', 'Model', mclust.options("emModelNames"), selected="VEV")
  ),
  mainPanel(
      h4("For clustering options, see"), a(href="http://cran.r-project.org/web/packages/mclust/mclust.pdf", "http://cran.r-project.org/web/packages/mclust/mclust.pdf"),
      plotOutput('plotClusters')
  )
))
