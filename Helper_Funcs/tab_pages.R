# Page used for inputting & viewing materials
material_input_page = function() {
  fluidPage(
    insert_material_row(),
    DT::dataTableOutput('material_log', width = 300)
    # TODO: Find out how to adjust data.table to make output look better 
    # (preferably no vertical scrolling)
    )
}

# Page used for inputting & Tracking sales
sales_tracker_page = function() {
  fluidPage(
    insert_transaction_row(),
    DT::dataTableOutput('transaction_log', width = 300)
  )
}