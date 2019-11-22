# Add new input data to existing data
update_data = function(history, new_input_data) {
  history <<- rbind(history, new_input_data)
  data.table::fwrite(history, 'Data/material_hist.csv')
}



# Taking Inputs -----------------------------------------------------------
# Row to insert new input materials
insert_material_row = function() {
  fluidRow(column(2, textInput('material_in', 'Item', '')),
           column(2, textInput('quantity_in', 'Quantity', '')),
           column(2, textInput('price_in', 'Price Paid', '')),
           column(2, textInput('desc_in', 'Description', '')),
           column(2, actionButton('update_materials', 'Add Items to History'))
  )
}

insert_transaction_row = function() {
  fluidRow(column(2, textInput('item_sold', 'Item', '')),
           column(2, textInput('quantity_sold', 'Quantity', '')),
           column(2, textInput('price_sold', 'Price', '')),
           column(2, textInput('desc_sold', 'Description', '')),
           column(2, checkboxInput('ah_sold', 'Auction House Purchase', value = TRUE))
           # TODO test checkbox
  )
}
