class Pharmacy < ApplicationRecord
  belongs_to :medication
  has_many :medicationorders
end
