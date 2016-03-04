require 'json'
class CartController < ApplicationController
	def add_item_to_cart
		debugger
		@product = Product.where(:product_id => params[:format]).first
		@cart = Cart.find(current_user.id)
		if @cart.cart_slot_one.nil?
			@cart.cart_slot_one = @product.product_id
			@cart.save
			if @cart.save
				p 'SAVED'
				@cart.cart_count = @cart.cart_count += 1
				@cart.save
			else
				p 'FAILED'
			end
		end
		if @cart.cart_slot_two.nil?
			@cart.cart_slot_two = @product.product_id
			@cart.save
			if @cart.save
				p 'SAVED'
				@cart.cart_count = @cart.cart_count += 1
				@cart.save
			else
				p 'FAILED'
			end
		end
		redirect_to root_path
	end

	def empty_cart
		@cart = current_user
		@cart.cart_number = 0
		@cart.cart_inventory = ''
		@cart.save
		redirect_to root_path
	end
end