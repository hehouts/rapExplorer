#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

# Load necessary libraries
library(shiny)

# Define UI
shinyUI(fluidPage(
  titlePanel("rapExplorer - Ratio And Proportion Explorer for hypothetical microbial abundance data"),
  
  sidebarLayout(
    sidebarPanel(
      # Input: Text box for vector input
      textInput("vector_input", 
                "Enter a comma-separated vector of 5 numbers:", 
                value = "1,2,3,4,5"),
      # Input: Text box for second vector input
      textInput("vector_input2", 
                "Enter a comma-separated vector of 5 numbers for the second plot:", 
                value = "2,4,6,8,10")
    ),
    
    mainPanel(
      # Output: Bar Plot
      plotOutput("barPlot"),
      plotOutput("barPlot2")
    )
  )
))

