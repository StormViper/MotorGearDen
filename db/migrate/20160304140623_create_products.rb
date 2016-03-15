class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
    	t.integer :product_id, null: false
    	t.integer :product_price, null: false
    	t.integer :cart_id
    	t.string :product_name, null: false
    	t.string :product_description, null: false

      t.timestamps null: false
    end
  end
end
