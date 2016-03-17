class AddBrandIdToUser < ActiveRecord::Migration
  def change
  	add_column :users, :brand_id, :integer, uniqueness: true
  	add_column :users, :is_brand?, :boolean, default: false
  end
end
