class AddFirstnameToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :firstname, :string
    add_column :users, :lastname, :string
    add_column :users, :phone, :string
    add_column :users, :address, :string
    add_column :users, :role, :integer
  end
end
