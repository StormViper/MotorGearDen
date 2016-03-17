class AddBrandIdToProduct < ActiveRecord::Migration
  def change
  	remove_column :products, :manufacturer_id
  	add_column :products, :brand_id, :integer, uniqueness: true
  end
end
