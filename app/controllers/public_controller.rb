class PublicController < ApplicationController
	def homepage
		if user_signed_in?
			@cart = Cart.where(:user_id => current_user.id).first if user_signed_in?
			@cart_items = [@cart.cart_slot_one, @cart.cart_slot_two, @cart.cart_slot_three, @cart.cart_slot_four, @cart.cart_slot_five,
										 @cart.cart_slot_six, @cart.cart_slot_seven, @cart.cart_slot_eight, @cart.cart_slot_nine, @cart.cart_slot_ten]
	    @user_products = []
	    @product = []
			@cart_items.each do |item|
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