class Slot < ActiveRecord::Base
	belongs_to :carts, dependent: :destroy
end
