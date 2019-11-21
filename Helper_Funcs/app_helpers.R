update_data = function(new_input_data) {
  history = data.table::fread('Data/input_hist.csv')
  history = rbind(history, new_input_data)
  data.table::fwrite(history, 'Data/input_hist.csv')
  
}

show_item_hist <- function() {
  # Read all the files into a list
  history = data.table::fread('Data/input_hist.csv')
  history
}

insert_input_row = function() {
  fluidRow(column(2, textInput(inputId = 'item', 'Item', '')),
           column(2, textInput('quantity', 'Quantity', '')),
           column(2, textInput('price', 'Price Paid', '')),
           column(2, textInput('desc', 'Description', '')),
           column(2, actionButton('update_inputs', 'Add Items to History'))
  )
}