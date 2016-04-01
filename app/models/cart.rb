class Cart < ActiveRecord::Base
	has_many :products, through: :products_cart
	has_many :products_cart
	belongs_to :user
	validates :user_id, presence: true, uniqueness: true
end
