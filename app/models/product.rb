class Product < ActiveRecord::Base
	has_many :carts
	belongs_to :brand
	validates :product_id, presence: true, uniqueness: true
	validates :product_price, presence: true
	validates :product_name, presence: true
	validates :product_description, presence: true
	validates :picture, presence: true
	mount_uploader :picture, PictureUploader
end
