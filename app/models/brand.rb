class Brand < ActiveRecord::Base
	has_many :product
	has_one :user
	has_many :paid_item
	validates :email, presence: :true, uniqueness: :true
	def self.search(search)
		if search
			Brand.where("name LIKE ?", "%#{search}%")
		else
			Brand.all
		end
	end
end
