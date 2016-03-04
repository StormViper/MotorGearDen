class PublicController < ApplicationController
	def homepage
		@product = Product.first if user_signed_in?
		@product_satan = Product.last if user_signed_in?
		@cart = Cart.where(:user_id => current_user.id).first if user_signed_in?
		@cart_product = Product.where(:product_id => @cart.cart_slot_one).first if user_signed_in?
		@cart_product_satan = Product.where(:product_id => @cart.cart_slot_two).first if user_signed_in?
	end
end