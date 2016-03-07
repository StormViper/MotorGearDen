class RemovePIdFromCartsAddSlotIdToCarts < ActiveRecord::Migration
  def change
  	remove_column :carts, :product_id
  	add_column :carts, :slot_id, :integer
  end
end
