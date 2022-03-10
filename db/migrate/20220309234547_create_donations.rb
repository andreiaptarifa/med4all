class CreateDonations < ActiveRecord::Migration[6.1]
  def change
    create_table :donations do |t|
      t.date :expiry_date
      t.integer :units
      t.references :user, null: false, foreign_key: true
      t.references :pharmacy, null: false, foreign_key: true
      t.references :medication, null: false, foreign_key: true

      t.timestamps
    end
  end
end
