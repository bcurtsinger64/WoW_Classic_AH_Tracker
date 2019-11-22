server = function(input, output, session) {

  # Manage inputs -----------------------------------------------------------
  # Generate new material input record
  material_input_form = reactive({
    new_record = data.table::data.table('Item' = input$material_in,
                                        'Quantity' = input$quantity_in,
                                        'Price Paid' = input$price_in,
                                        'Description' = input$desc_in,
                                        'Date' = Sys.Date())
    return(new_record)
  })
  

  # Initial Rendering -------------------------------------------------------
  # Render input log history
  output$material_log = DT::renderDataTable({
    material_history
  })
  
  
  # Observe Events ----------------------------------------------------------
  # Add new record to input table
  observeEvent(input$update_materials, {
    new_record = material_input_form()
    update_data(material_history, new_record)
    output$material_log = DT::renderDataTable({
      material_history
    })
  })
}
