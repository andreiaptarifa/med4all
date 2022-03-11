require 'csv'

filepath = "db/data/new_csv.csv"

CSV.foreach(filepath, quote_char: "\x00", headers: :first_row) do |row|

  pharmacies = Pharmacy.new(
    pharmacy_name: "#{row[1]}",
    pharmacy_address: "#{row[2]}, #{row[0]}"
  )
end

filepath_grandesp = "db/data/unidades_grandesp.csv"

CSV.foreach(filepath_grandesp, headers: :first_row) do |row|

  pharmacies = Pharmacy.new(
    pharmacy_name: "#{row[2]}",
    pharmacy_address: "#{row[3]}, #{row[1]}"
  )
end

filepath_capital = "db/data/unidades_capital.csv"

CSV.foreach(filepath_capital, headers: :first_row) do |row|
  pharmacy = Pharmacy.new(
    pharmacy_name: "#{row[0]}",
    pharmacy_address: "#{row[1]}, São Paulo"
  )
end
