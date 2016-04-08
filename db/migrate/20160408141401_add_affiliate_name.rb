class AddAffiliateName < ActiveRecord::Migration
  def change
  	add_column :affiliates, :affiliate_name, :string
  end
end
