class AddAmountToCart < ActiveRecord::Migration
  def change
  	add_column :carts, :cart_count, :integer
  end
end
