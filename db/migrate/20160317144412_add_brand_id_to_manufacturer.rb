class AddBrandIdToManufacturer < ActiveRecord::Migration
  def change
  	add_column :brands, :brand_id, :integer, uniqueness: true
  end
end
