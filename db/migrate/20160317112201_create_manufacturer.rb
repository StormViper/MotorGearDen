class CreateManufacturer < ActiveRecord::Migration
  def change
    create_table :manufacturers do |t|
    	t.string :name, null: false
    	t.string :email, null: false
    	t.string :description
    	t.string :website
    end
  end
end
