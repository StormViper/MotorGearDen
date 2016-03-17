class AddUserIdToManufacturer < ActiveRecord::Migration
  def change
  	add_column :brands, :user_id, :integer, presence: true, uniqueness: true
  end
end
