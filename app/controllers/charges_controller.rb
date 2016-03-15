class ChargesController < ApplicationController
	before_action :authenticate_user!
	def new
		@total = 0
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
		@user_products.each do |p|
			@total += p.product_price
		end

		@cart.total = @total
		@cart.save!
	end

	def create

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

		@cart = current_user.carts.first
		@total = @cart.total
		@amount = @cart.total * 100

		customer = Stripe::Customer.create(
			:email => current_user.email,
			:card => params[:stripeToken]
			)

		charge = Stripe::Charge.create(
			:customer => customer.id,
			:amount => @amount,
			:description => 'A customer',
			:currency => 'GBP'
			)

	rescue Stripe::CardError => e
		flash[:danger] = e.message
		redirect_to root_path
	end
	end