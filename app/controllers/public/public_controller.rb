class Public::PublicController < ApplicationController
	def homepage
			@products = Product.all
		if user_signed_in?
			@cart = Cart.where(:user_id => current_user.id).first if user_signed_in?
			@slots = @cart.slots.first
			@slot_list = [@slots.slot_one, @slots.slot_two, @slots.slot_three, @slots.slot_four, @slots.slot_five,
									  @slots.slot_six, @slots.slot_seven, @slots.slot_eight, @slots.slot_nine, @slots.slot_ten]
	    @user_products = []
	    @product = []
			@slot_list.each do |item|
			if item.nil?
					p 'Item empty'
				else				
					@product << item
			end
			end
				@product.each do |item|
				items = Product.where(:product_id => item).first
				@user_products << items
			end
		end
	end
end