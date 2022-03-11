class RemoveConcentrationFromMedications < ActiveRecord::Migration[6.1]
  def change
    remove_column :medications, :concentration, :integer
  end
end
