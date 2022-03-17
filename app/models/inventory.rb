class Inventory < ApplicationRecord
  belongs_to :medication
  belongs_to :pharmacy
  validates :medication_id, uniqueness: { scope: :pharmacy_id }
end
