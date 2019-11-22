# Page used for inputting & viewing materials
material_input_page = function() {
  fluidPage(
    insert_material_row(),
    DT::dataTableOutput('material_log', width = 300)
    )
}

# Page used for inputting & Tracking sales
sales_tracker_page = function() {
  fluidPage(
    
  )
}