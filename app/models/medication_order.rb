class MedicationOrder < ApplicationRecord
  belongs_to :user
  belongs_to :medication
  belongs_to :pharmacy
end
