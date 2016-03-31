class ChangePercentageToInteger < ActiveRecord::Migration
  def change
  	change_column :brands, :percentage, :integer
  end
end
