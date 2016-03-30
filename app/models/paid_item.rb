class PaidItem < ActiveRecord::Base
	belongs_to :brand
	belongs_to :product
end
