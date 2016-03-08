class Slot < ActiveRecord::Base
	belongs_to :carts, dependent: :destroy
	validates :cart_id, presence: true, uniqueness: true
end
