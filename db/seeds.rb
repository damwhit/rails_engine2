require 'csv'

Transaction.destroy_all
InvoiceItem.destroy_all
Invoice.destroy_all
Customer.destroy_all
Item.destroy_all
Merchant.destroy_all

CSV.foreach('db/csv_data/merchants.csv', headers: true, header_converters: :symbol) do |row|
  Merchant.create(row.to_h)
end

CSV.foreach('db/csv_data/items.csv', headers: true, header_converters: :symbol) do |row|
  Item.create( {
    id: row[:id],
    name: row[:name],
    description: row[:description],
    unit_price: (row[:unit_price].to_f * 0.01).round(2),
    merchant_id: row[:merchant_id]
  } )
end

CSV.foreach('db/csv_data/customers.csv', headers: true, header_converters: :symbol) do |row|
  Customer.create(row.to_h)
end

CSV.foreach('db/csv_data/invoices.csv', headers: true, header_converters: :symbol) do |row|
  Invoice.create(row.to_h)
end

CSV.foreach('db/csv_data/invoice_items.csv', headers: true, header_converters: :symbol) do |row|
  InvoiceItem.create( {
    quantity: row[:quantity],
    item_id: row[:item_id],
    invoice_id: row[:invoice_id],
    created_at: row[:created_at],
    updated_at: row[:updated_at],
    unit_price: (row[:unit_price].to_f * 0.01).round(2)
  } )
end

CSV.foreach('db/csv_data/transactions.csv', headers: true, header_converters: :symbol) do |row|
  Transaction.create(row.to_h)
end

ActiveRecord::Base.connection.tables.each do |t|
  ActiveRecord::Base.connection.execute("ALTER TABLE #{t} AUTO_INCREMENT = 1")
end

