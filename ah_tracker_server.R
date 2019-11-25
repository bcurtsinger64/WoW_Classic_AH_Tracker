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
  
  transaction_input_form = reactive({
    new_record = data.table::data.table('Item' = input$item_sold,
                                        'Quantity' = input$quantity_sold,
                                        'Price' = input$price_sold,
                                        'Sold on AH' = input$ah_sold,
                                        'Description' = input$desc_sold,
                                        'Date' = Sys.Date())
    return(new_record)
  })
  

  # Initial Rendering -------------------------------------------------------
  # Render input log history
  output$material_log = DT::renderDataTable({
    material_history
  })
  
  output$transaction_log = DT::renderDataTable({
    transaction_history
  })
  
  
  # Observe Events ----------------------------------------------------------
  # Add new record to input table
  observeEvent(input$update_materials, {
    new_record = material_input_form()
    material_history = update_data(material_history,
                                   new_record,
                                   'Data/material_hist.csv')
    output$material_log = DT::renderDataTable({
      material_history
    })
  })
  
  # Add new record to transaction table
  observeEvent(input$update_transactions, {
    new_record = transaction_input_form()
    transaction_history = update_data(transaction_history,
                                      new_record,
                                      'Data/transaction_hist.csv')
    output$transaction_log = DT::renderDataTable({
      transaction_history
    })
  })
}