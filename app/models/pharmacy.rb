class Pharmacy < ApplicationRecord
  has_many :medicationorders
  geocoded_by :pharmacy_address
  after_validation :geocode, if: :will_save_change_to_pharmacy_address?
end
