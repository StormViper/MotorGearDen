class CreateUserDetails < ActiveRecord::Migration
  def change
    create_table :user_details do |t|
    	t.string :username
    	t.string :email
    	t.string :address_line_one
    	t.string :address_line_two
    	t.string :address_line_three
    	t.string :address_line_four
    	t.string :address_line_five
    	t.string :phone
    	t.boolean :is_brand?
    	t.string :brand_name
    	t.string :brand_email
    	t.string :brand_website
    	t.integer :user_id
      t.timestamps null: false
    end
  end
end
