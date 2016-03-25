class Brand < ActiveRecord::Base
	has_many :product
	has_one :user
	def self.search(search)
		if search
			Brand.where("name LIKE ?", "%#{search}%")
		else
			Brand.all
		end
	end
end
