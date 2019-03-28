class AddNameToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :string
    add_column :users, :phone_number, :string
    add_column :users, :biography, :text
    add_column :users, :confirmation_token, :string
    add_column :users, :wait_order, :integer
  end
end
