class CreatePaidItems < ActiveRecord::Migration
  def change
    create_table :paid_items do |t|
    	t.string  	:brand_name
    	t.string  	:product_name
    	t.integer 	:brand_id
    	t.integer 	:product_price
    	t.integer 	:product_id
      t.timestamps null: false
    end
  end
end
