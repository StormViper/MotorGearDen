class CreateSlots < ActiveRecord::Migration
  def change
    create_table :slots do |t|
    	t.string :slot_one
    	t.string :slot_two
    	t.string :slot_three
    	t.string :slot_four
    	t.string :slot_five
    	t.string :slot_six
    	t.string :slot_seven
    	t.string :slot_eight
    	t.string :slot_nine
    	t.string :slot_ten
    	t.integer :cart_id, null: false
      t.timestamps null: false
    end
  end
end
