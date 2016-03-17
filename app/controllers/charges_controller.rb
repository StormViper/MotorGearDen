class ChargesController < ApplicationController
	before_action :authenticate_user!
	def new
		@cart = Cart.where(:user_id => current_user.id).first if user_signed_in?
		@user_products = get_user_products!
		@total = get_user_total!

		@cart.total = @total
		@cart.save!
	end

	def create
		@user_products = get_user_products!
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

	clear_cart!
	rescue Stripe::CardError => e
		flash[:danger] = e.message
		redirect_to root_path
	end

	end