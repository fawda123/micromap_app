library(shiny)
library(micromap)
library(datasets)

# data
statdat <- state.x77

# spatial data
data(USstates)

# define server for the application
server <- function(input, output) {
  
  output$p1 <- renderPlot({
    
    # include median value, groupings
    medval <- as.logical(x = input$medval)
    grps <- input$grps
    
    # input variables, dates, and order
    vr1 <- input$vr1
    vr2 <- input$vr2
    
    # name the variable for ordering
    ords <- input$ords
    ords <- gsub(pattern = "Variable\\s", replacement = "vr", x = ords)
    
    # subset variables and dates, combine
    toplo <- statdat[, c(vr1, vr2)]
    toplo <- data.frame(toplo)  
    names(toplo) <- c("vr1", "vr2")
    toplo$ST <- row.names(x = toplo)
    
    # create map table for polygons
    polys <- create_map_table(tmp.map = USstates, IDcolumn = "ST_NAME")
    
    # plot
    mmplot(stat.data = toplo,
           map.data = polys,
           panel.types = c("labels", "dot", "dot", "map"),
           panel.data = list("ST", "vr1", "vr2", NA),
           ord.by = ords,  
           median.row = medval,
           grouping = grps,
           map.link = c("ST", "ID"), 
           panel.att = list(
             list(2, header = vr1),
             list(3, header = vr2)
           ))
    
  })
  
}