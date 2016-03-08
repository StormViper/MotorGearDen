class Cart < ActiveRecord::Base
	has_many :products
	has_many :slots, dependent: :destroy
	validates :user_id, presence: true, uniqueness: true
	validates :slot_id, presence: true, uniqueness: true
end
