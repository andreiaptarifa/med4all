class Donation < ApplicationRecord
  belongs_to :user
  belongs_to :pharmacy
  belongs_to :medication
end
