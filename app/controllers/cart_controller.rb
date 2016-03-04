require 'json'
class CartController < ApplicationController
	def add_item_to_cart
		redirect_to root_path if !user_signed_in?
		@product = Product.where(:product_id => params[:format]).first
		@cart = Cart.where(:user_id => current_user.id).first
		@cart_items = [@cart.cart_slot_one, @cart.cart_slot_two, @cart.cart_slot_three, @cart.cart_slot_four, @cart.cart_slot_five,
									 @cart.cart_slot_six, @cart.cart_slot_seven, @cart.cart_slot_eight, @cart.cart_slot_nine, @cart.cart_slot_ten]
    @cart_items.each do |item|
    	if item.nil?
    		@selected_one = @product.product_id
    		if !item.nil?
    			nil
    		end
    	end
    end
    debugger
    @cast = Cart.where("user_id = ? AND cart_slot_one = ? AND cart_slot_two = ? AND cart_slot_three = ? AND cart_slot_four = ? AND cart_slot_five = ?
    										cart_slot_six = ? AND cart_slot_seven = ? AND cart_slot_eight = ? AND cart_slot_nine = ? AND cart_slot_ten = ?", current_user.id, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, ).first

    p 'Hello world'
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