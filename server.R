library(shiny)
library(micromap)
library(datasets)

# data
statdat <- state.x77

# spatial data
data(USstates)

shinyServer(function(input, output) {
   
  output$p1 <- renderPlot({

    # include median value, gruopings
    medval <- as.logical(input$medval)
    grps <- input$grps

    # input variables, dates, and order
    vr1 <- input$vr1
    vr2 <- input$vr2

    ords <- input$ords
    ords <- gsub('Variable\\s', 'vr', ords)
    
    # subset variables and dates, combine
    toplo <- statdat[, c(vr1, vr2)]
    toplo <- data.frame(toplo)  
    names(toplo) <- c('vr1', 'vr2')
    toplo$ST <- row.names(toplo)
    
    # create map table for polygons
    polys <- create_map_table(USstates, 'ST_NAME')

    # plot
    mmplot(stat.data = toplo,
      map.data = polys,
      panel.types = c('labels', 'dot', 'dot', 'map'),
      panel.data = list('ST', 'vr1', 'vr2', NA),
      ord.by = ords,  
      median.row = medval,
      grouping = grps,
      map.link = c('ST', 'ID'), 
        panel.att = list(
          list(2, header = vr1),
          list(3, header = vr2)
        ))

  })
  
})
