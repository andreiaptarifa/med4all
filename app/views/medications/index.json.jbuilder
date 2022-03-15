# json.inserted_item

# @people = People.all

# json.array! @medication, :id, :
# json.medications @medications do |med|
#   json.partial!("medication.html.erb", medication: med)
# end

json.array! @medications, partial: 'medication.html.erb', as: :medication

# => [ { "id": 1, "name": "David" }, { "id": 2, "name": "Jamie" } ]

# @medications.each do |med|
#   json.inserted_item json.partial!("medication.html.erb", medication: med)
# end
