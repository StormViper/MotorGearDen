class CreateAffiliates < ActiveRecord::Migration
  def change
    create_table :affiliates do |t|
    	t.string :name
    	t.string :image_url
    	t.string :link_url
    	t.boolean :is_enabled?
      t.timestamps null: false
    end
  end
end
