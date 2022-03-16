class Inventory < ApplicationRecord
  belongs_to :medication
  belongs_to :pharmacy
end
