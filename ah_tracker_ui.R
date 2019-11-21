library(shiny)
## UI TODO:
# Add tab for inputting and showing inventory
# Add tab for inputting and showing auction / sale history
# Add tab for inputting and storing recipes
# Add tab for items created which uses inventory and recipes
# Add tab for showing possible outputs given existing inventory
shinyApp(
  ui = fluidPage(
    titlePanel('WoW Classic Gold Tracker'),
    
    insert_input_row(),
    
    DT::dataTableOutput('item_log', width = 300), tags$hr(),
    
    mainPanel()
    
  ),
  server = server
)