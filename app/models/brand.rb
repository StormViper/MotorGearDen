class Brand < ActiveRecord::Base
	has_many :product, dependent: :destroy
	has_one :user
	has_many :paid_item, dependent: :destroy
	validates :email, presence: :true, uniqueness: :true
	def self.search(search)
		if search
			Brand.where("name LIKE ?", "%#{search}%")
		else
			Brand.all
		end
	end
end
