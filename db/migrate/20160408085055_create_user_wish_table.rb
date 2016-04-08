class CreateUserWishTable < ActiveRecord::Migration
  def change
    create_table :user_wishes do |t|
    	t.integer :product_id
    	t.integer :user_id
    	t.timestamps null: false
    end
  end
end
