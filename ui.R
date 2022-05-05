library(shiny)
library(shinythemes)
library(micromap)
library(datasets)

# data
statdat <- state.x77

# spatial data
data(USstates)

# variables
vrs <- colnames(statdat)

# Define UI for application
shinyUI(fluidPage(
  
  theme = shinytheme('journal'), 
  
  # main panel
  mainPanel(width = 12,
      
    # spacing
    fluidRow(HTML('<p><h3>Micromap Shiny Application</h3></p>')),
    
    #spacing
    fluidRow(HTML('<p></p>')),
      
    # first row of plots
    fluidRow(
      
      column(width = 2, 
        selectInput(inputId = 'vr1', 
          label = h4('Variable 1'),
          choices = vrs,
          selected = vrs[1]
          )
        ),
      
      column(width = 2, 
        selectInput(inputId = 'vr2', 
          label = h4('Variable 2'),
          choices = vrs,
          selected = vrs[2]
          )
        ),
      
      column(width = 2, 
        numericInput("grps", 
          label = h4("Groupings"), 
          value = 10, 
          min = 1, 
          max = 50
          )
        ),
      
      column(width = 2,
        radioButtons(inputId = 'medval', 
          label = h4('Median value?'),
          choices = c(TRUE, FALSE),
          selected = c(FALSE), 
          inline = TRUE
          )
        ),
      
      column(width = 3,
        radioButtons(inputId = 'ords', 
          label = h4('Order by'),
          choices = c('Variable 1', 'Variable 2'),
          selected = c('Variable 1'), 
          inline = TRUE
          )
        ),
      
      column(width = 12, 
        
        plotOutput("p1", width = '1000px', height = '750px')
        
        )
      
      ) 
    
    )
        
))