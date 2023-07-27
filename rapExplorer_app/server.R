# Load necessary libraries
library(shiny)
library(ggplot2)

# Define server logic
shinyServer(function(input, output) {
  
  # Function to generate barplot data from input
  generate_data <- function(input_vector) {
    # Split input by commas and convert to numeric
    split_vector <- strsplit(input_vector, ",")[[1]]
    numeric_vector <- as.numeric(split_vector)
    
    # Error handling if length of the vector is not 5
    if(length(numeric_vector) != 5){
      stop("Please enter exactly 5 numbers.")
    }
    
    # Create a dataframe from the vector
    data_frame <- data.frame(Category = factor(c("1","2","3","4","5")),
                             Value = numeric_vector)
    
    return(data_frame)
  }
  
  # Reactive expressions to generate the barplot data
  barplot_data1 <- reactive({
    generate_data(input$vector_input1)
  })
  
  barplot_data2 <- reactive({
    generate_data(input$vector_input2)
  })
  
#  # Render the plots
#  output$barPlot1 <- renderPlot({
#    ggplot(barplot_data1(), aes(x = Category, y = Value, fill = Category)) +
#      geom_bar(stat = "identity") +
#      theme_minimal() +
#      ggtitle("Stacked Barplot 1") +
#      labs(x = "Category", y = "Value")
#  }, res = 96) # Set resolution to 96 dpi

  output$barPlot1 <- renderPlot({
    ggplot(barplot_data1(), aes(x = Category, y = Value)) +
      geom_bar(stat = "identity", fill = "red") +
      theme_minimal() +
      ggtitle("Stacked Barplot 2") +
      labs(x = "Category", y = "Value")
  }, res = 96) # Set resolution to 96 dpi  
    
  output$barPlot2 <- renderPlot({
    ggplot(barplot_data2(), aes(x = Category, y = Value)) +
      geom_bar(stat = "identity", fill = "blue") +
      theme_minimal() +
      ggtitle("Stacked Barplot 2") +
      labs(x = "Category", y = "Value")
  }, res = 96) # Set resolution to 96 dpi
})
