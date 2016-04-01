class CreateProductsCarts < ActiveRecord::Migration
  def change
    create_table :products_carts do |t|
    	t.integer :product_id
    	t.integer :cart_id
      t.timestamps null: false
    end
  end
end
