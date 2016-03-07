class RemoveSlotsFromCart < ActiveRecord::Migration
  def change
  	remove_column :carts, :cart_slot_one
  	remove_column :carts, :cart_slot_two
  	remove_column :carts, :cart_slot_three
  	remove_column :carts, :cart_slot_four
  	remove_column :carts, :cart_slot_five
  	remove_column :carts, :cart_slot_six
  	remove_column :carts, :cart_slot_seven
  	remove_column :carts, :cart_slot_eight
  	remove_column :carts, :cart_slot_nine
  	remove_column :carts, :cart_slot_ten
  end
end
