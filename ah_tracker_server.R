server = function(input, output, session) {
  input_form = reactive({
    data = sapply(fields, function(x) input[[x]])
    data
  })
  
  observeEvent(input$update_inputs, {
    update_data(input_form())
  })
  
  output$item_log = DT::renderDataTable({
    input$submit
    show_item_hist()
  })
}