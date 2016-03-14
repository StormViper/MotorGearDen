class AddPictureToProductRemoveImageUrl < ActiveRecord::Migration
  def change
  	remove_column :products, :image_url
  	add_column :products, :picture, :string
  end
end
