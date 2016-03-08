class Product < ActiveRecord::Base
	has_many :carts
	validates :product_id, presence: true, uniqueness: true
	validates :product_price, presence: true, uniqueness: true
	validates :product_name, presence: true
	validates :product_description, presence: true
	validates :image_url, presence: true
end
