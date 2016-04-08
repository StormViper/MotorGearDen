class Product < ActiveRecord::Base
	has_many :cart, through: :products_cart
	has_many :products_category
	has_many :products_cart
	has_many :category, through: :products_category
	has_many :user_wishes
	has_many :users, :through => :user_wishes
	has_many :paid_item
	belongs_to :brand
	validates :product_id, presence: true, uniqueness: true
	validates :product_price, presence: true
	validates :product_name, presence: true
	validates :product_description, presence: true
	validates :picture, presence: true
	mount_uploader :picture, PictureUploader
end
