class CreateMedications < ActiveRecord::Migration[6.1]
  def change
    create_table :medications do |t|
      t.string :active_substance
      t.string :commercial_name
      t.integer :concentration
      t.string :lab

      t.timestamps
    end
  end
end
