class RemoveCartIdFromProductsAddImagesToProducts < ActiveRecord::Migration
  def change
  	remove_column :products, :cart_id
  	add_column :products, :image_url, :string
  end
end
