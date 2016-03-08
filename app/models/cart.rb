class Cart < ActiveRecord::Base
	has_many :products
	has_many :slots, dependent: :destroy
end
