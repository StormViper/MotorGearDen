require 'json'
class Cart::CartController < ApplicationController
	before_action :authenticate_user!
	def add_item_to_cart
		redirect_to root_path if !user_signed_in?
		@product = Product.where(:product_id => params[:format]).first
		@cart = current_user.cart
		@slots = @cart.products
		@slots << @product
		@cart.cart_count += 1
		@cart.save
		redirect_to root_path
	end


	def empty_cart
		clear_cart!

		flash[:warning] = "Your cart has been emptied."
		redirect_to root_path
	end

	def destroy
		@cart = current_user.carts.first
		@cart.destroy
		redirect_to root_path
	end

	def show
		@user_products = get_user_products!
		@total = get_user_total!
		@cart = current_user.cart

		@cart.total = @total
		@cart.save
	end
end