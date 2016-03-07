require 'json'
class CartController < ApplicationController
	def add_item_to_cart
		redirect_to root_path if !user_signed_in?
		@product = Product.where(:product_id => params[:format]).first
		@cart = current_user.carts.first
		@slots = @cart.slots.first
		if @slots.slot_one == nil
			@slots.slot_one = @product.product_id
			nil
		elsif @slots.slot_two == nil
			@slots.slot_two = @product.product_id
			nil
		elsif @slots.slot_three == nil
			@slots.slot_three = @product.product_id
			nil
		elsif @slots.slot_four == nil
			@slots.slot_four = @product.product_id
			nil
		elsif @slots.slot_five == nil
			@slots.slot_five = @product.product_id
			nil
		elsif @slots.slot_six == nil
			@slots.slot_six = @product.product_id
			nil
		elsif @slots.slot_seven == nil
			@slots.slot_seven = @product.product_id
			nil
		elsif @slots.slot_eight == nil
			@slots.slot_eight = @product.product_id
			nil
		elsif @slots.slot_nine == nil
			@slots.slot_nine = @product.product_id
			nil
		elsif @slots.slot_nine == nil
			@slots.slot_ten = @product.product_id
			nil
		end
		@slots.save
		redirect_to root_path
	end


	def empty_cart
		@cart = current_user.carts.first
		@slots = @cart.slots.first
		@slots.slot_one = nil
		@slots.slot_two = nil
		@slots.slot_three = nil
		@slots.slot_four = nil
		@slots.slot_five = nil

		@slots.slot_six = nil
		@slots.slot_seven = nil
		@slots.slot_eight = nil
		@slots.slot_nine = nil
		@slots.slot_ten = nil
		@slots.save
		redirect_to root_path
	end
end