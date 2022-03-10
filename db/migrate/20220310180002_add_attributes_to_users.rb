class AddAttributesToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :gender, :string
    add_column :users, :birthday, :date
    add_column :users, :cellphone, :string
    add_column :users, :cpf, :string
    add_column :users, :user_type, :string
  end
end
