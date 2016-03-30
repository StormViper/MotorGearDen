class AddPercentageToBrand < ActiveRecord::Migration
  def change
  	add_column :brands, :percentage, :float
  end
end
	