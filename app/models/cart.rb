class Cart < ActiveRecord::Base
	has_many :products
	has_many :slot, dependent: :destroy
	belongs_to :user
	validates :user_id, presence: true, uniqueness: true
end
