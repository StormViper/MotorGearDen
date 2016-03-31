class Affiliate < ActiveRecord::Base
	def self.search(search)
		if search
			Affiliate.where("name LIKE ?", "%#{search}%")
		else
			Affiliate.all
		end
	end
end

