class AddAddressesToUser < ActiveRecord::Migration
  def change
  	add_column :users, :door_name_number, :string
  	add_column :users, :street, :string
  	add_column :users, :city, :string
  	add_column :users, :borough, :string
  	add_column :users, :postcode, :string
  end
end
