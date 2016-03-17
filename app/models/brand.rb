class Brand < ActiveRecord::Base
	has_many :product
	has_one :user
end
