
require "csv"

filepath_capital = "db/data/unidades_capital.csv"

CSV.foreach(filepath_capital, quote_char: "\x00", headers: :first_row) do |row|
  pharmacy = Pharmacy.new(
    pharmacy_name: "#{row[0]}",
    pharmacy_address: "#{row[1]}, São Paulo"
  )
end
