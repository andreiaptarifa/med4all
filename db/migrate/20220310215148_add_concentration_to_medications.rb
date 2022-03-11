class AddConcentrationToMedications < ActiveRecord::Migration[6.1]
  def change
    add_column :medications, :concentration, :string
  end
end
