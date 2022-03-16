class AddAddressToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :street, :string
    add_column :users, :number, :string
    add_column :users, :city, :string
  end
end
