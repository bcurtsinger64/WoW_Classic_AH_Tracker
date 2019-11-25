library(shiny)
library(lubridate)
source('ah_tracker_server.R')
source('Helper_Funcs/app_helpers.R')
source('Helper_Funcs/tab_pages.R')

# Global Vars
material_history = data.table::fread('Data/material_hist.csv')
material_history[, Date := lubridate::ymd(Date)]

transaction_history = data.table::fread('Data/transaction_hist.csv')
transaction_history[, Date := lubridate::ymd(Date)]
# Constants
AH_CUT = 0.05

## UI TODO:
# Add tab for inputting and storing recipes
# Add tab for items created which uses inventory and recipes
# Add tab for showing possible outputs given existing inventory
# TODO: Formatting / pretty up
# TODO: Create balance sheet of currently available materials & crafted items
# 
shinyApp(
  ui = fluidPage(
    titlePanel('WoW Classic Gold Tracker'),
    
    mainPanel(
      tabsetPanel(type = 'tabs',
                  tabPanel('Manage Inventory', material_input_page()),
                  tabPanel('Manage Sales', sales_tracker_page())
                  # tabPanel('Manage Recipes', recipe_holder),
                  # tabPanel('Manage Item Creation', creation_holder),
                  # tabPanel('View Possible Outputs', output_holder)
      )
    )
  ),
  server = server
)
