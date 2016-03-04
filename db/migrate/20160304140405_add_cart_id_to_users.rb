class AddCartIdToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :cart_id, :integer

  	remove_column :users, :cart_inventory
  	remove_column :users, :cart_number
  end
end
