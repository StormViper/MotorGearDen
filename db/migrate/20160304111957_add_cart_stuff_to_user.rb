class AddCartStuffToUser < ActiveRecord::Migration
  def change
  	add_column :users, :cart_inventory, :string
  	add_column :users, :cart_number, :integer
  end
end
