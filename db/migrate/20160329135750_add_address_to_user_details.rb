class AddAddressToUserDetails < ActiveRecord::Migration
  def change
  	add_column :user_details, :address, :string
  end
end
