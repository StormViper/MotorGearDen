class Affiliate < ActiveRecord::Base
	validates :name, uniqueness: :true
	def self.search(search)
		if search
			Affiliate.where("name LIKE ?", "%#{search}%")
		else
			Affiliate.all
		end
	end
end

