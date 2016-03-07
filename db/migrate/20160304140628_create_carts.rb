class CreateCarts < ActiveRecord::Migration
  def change
    create_table :carts do |t|
    	t.string :cart_slot_one
    	t.string :cart_slot_two
    	t.string :cart_slot_three
    	t.string :cart_slot_four
    	t.string :cart_slot_five
    	t.string :cart_slot_six
    	t.string :cart_slot_seven
    	t.string :cart_slot_eight
    	t.string :cart_slot_nine
    	t.string :cart_slot_ten
    	t.integer :user_id, null: false
    	t.integer :product_id

      t.timestamps null: false
    end
  end
end
