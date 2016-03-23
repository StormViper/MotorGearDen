class AddUserDetailIdToUser < ActiveRecord::Migration
  def change
  	add_column :users, :user_detail_id, :integer
  end
end
