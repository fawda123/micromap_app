library(shiny)
library(shinythemes)
library(datasets)

# variables
vrs <- colnames(x = state.x77)

# define ui for application
ui <- fluidPage(
  
  theme = shinytheme(theme = "journal"), 
  
  titlePanel(title = "Micromap Shiny Application"), 
  
  sidebarLayout(
    
    # side bar
    sidebarPanel(width = 2,
                 
                 selectInput(inputId = "vr1", 
                             label = h4("Variable 1"),
                             choices = vrs,
                             selected = vrs[1]
                 ),
                 
                 selectInput(inputId = "vr2", 
                             label = h4("Variable 2"),
                             choices = vrs,
                             selected = vrs[2]
                 ),
                 
                 numericInput(inputId = "grps", 
                              label = h4("Groupings"), 
                              value = 10, 
                              min = 1, 
                              max = 50
                 ),
                 
                 radioButtons(inputId = "medval", 
                              label = h4("Median value?"),
                              choices = c(TRUE, FALSE),
                              selected = c(FALSE), 
                              inline = TRUE
                 ),
                 
                 radioButtons(inputId = "ords", 
                              label = h4("Order by"),
                              choices = c("Variable 1", "Variable 2"),
                              selected = c("Variable 1"), 
                              inline = TRUE
                 )
                 
    ), 
    
    # main panel
    mainPanel(
      
      plotOutput(outputId = "p1", width = "700px", height = "750px")
      
    )
    
  )
  
)