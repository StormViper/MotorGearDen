require 'json'
class Cart::CartController < ApplicationController
	before_action :authenticate_user!
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
		elsif @slots.slot_ten == nil
			@slots.slot_ten = @product.product_id
			nil
		end
		@slots.save
		if @slots.save && @cart.cart_count < 10
				@cart.cart_count += 1
				@cart.save
		end
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
		@cart.cart_count = 0
		@cart.save

		flash[:warning] = "Your cart has been emptied."
		redirect_to root_path
	end

	def destroy
		@cart = current_user.carts.first
		@cart.destroy
		redirect_to root_path
	end

	def show
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

		#@total = @user_products[0].product_price + @user_products[1].product_price + @user_products[2].product_price + @user_products[3].product_price + @user_products[4].product_price + @user_products[5].product_price
					 										 #+ @user_products[6].product_price + @user_products[7].product_price + @user_products[8].product_price + @user_products[9].product_price
	end
end