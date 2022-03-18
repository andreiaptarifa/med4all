# nokogiri requires open-uri
require 'nokogiri'
require 'open-uri'
# csv will be used to export data
require 'csv'
# MedicationOrder.destroy_all
# Donation.destroy_all
# Inventory.destroy_all
# Pharmacy.destroy_all
# Medication.destroy_all

# letters = ("a".."z").to_a

# active_principles = []

# letters.each do |letter|
#   url = "https://consultaremedios.com.br/principios-ativos/#{letter}"
#   html_file = URI.open(url).read
#   html_doc = Nokogiri::HTML(html_file)
#   html_doc.search(".content-grid.content-grid--text-links a").each do |element|
#     url = "https://consultaremedios.com.br#{element.attribute("href").value}"
#     # puts element.text.strip
#     # puts url
#     active_principles << url
#   end
# end

# medications = []

# active_principles.first(10).each do |active_principle|
#   sleep 2
#   html_file = URI.open(active_principle).read
#   html_doc = Nokogiri::HTML(html_file)
#   html_doc.search(".result-item__title a").each do |element|
#     url = "https://consultaremedios.com.br#{element.attribute("href").value}"
#     medications << url

#     # puts element.attribute("href").value
#   end
# end
# # puts medications[0]
# puts "--> Até aqui deu certo :D"

# meds = []
# medications.uniq.first(10).each do |medication|
#   p medication
#   sleep 2
#   html_file = URI.open(medication).read
#   html_doc = Nokogiri::HTML(html_file)
#   html_doc.search(".new-product-header__top-side.new-product-header__top-side--quantity-ab-test").each do |element|
#     active_substance = element.search("div .new-product-header__top-side__top-middle-side__substance-wrapper").first.text,
#     commercial_name = element.search(".new-product-header__top-side__top-middle-side__title-wrapper").first.text.strip.split(',')[0].split(/\s*\A\s*(\w+)\s*(\w+)/)[1],
#     concentration = element.search(".new-product-header__top-side__top-middle-side__title-wrapper").first.text.strip.split(',')[0].split(/(\d+\w+.\w+)/)[1],
#     lab = element.search(".new-product-header__topic.new-product-header__topic--factory .new-product-header__factory-wrapper__text b").text.strip
#     if active_substance && commercial_name && concentration && lab && Medication.where(active_substance: active_substance[0], concentration: concentration).count.zero?

#         Medication.create!(
#                             active_substance: active_substance[0],
#                             commercial_name: commercial_name,
#                             concentration: concentration,
#                             lab: lab
#                             # imagem: element.search(".new-product-header__top-side__top-left-side img")
#         )
#       else
#         puts "falha na regex"
#         puts "active_substance: #{active_substance}"
#     end
#     end
#   end


# filepath = "db/data/new_csv.csv"

# CSV.foreach(filepath, quote_char: "\x00", headers: :first_row) do |row|
#   pharmacy_interior = Pharmacy.new(
#     pharmacy_name: "#{row[1]}",
#     pharmacy_address: "#{row[2]}, #{row[0]}"
#   )
#   pharmacy_interior.save!
# end

filepath_grandesp = "db/data/unidades_grandesp.csv"

CSV.foreach(filepath_grandesp, headers: :first_row) do |row|
 pharmacy_grande = Pharmacy.new(
    pharmacy_name: "#{row[2]}",
    pharmacy_address: "#{row[3]}, #{row[1]}"
  )
  pharmacy_grande.save!
end

filepath_capital = "db/data/unidades_capital.csv"

CSV.foreach(filepath_capital, headers: :first_row) do |row|
  pharmacy_capital = Pharmacy.new(
    pharmacy_name: "#{row[0]}",
    pharmacy_address: "#{row[1]}, São Paulo"
  )
  pharmacy_capital.save!
end
