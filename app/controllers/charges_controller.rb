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
		@brands = get_brands!(current_user, @user_products)
		@cart = current_user.cart
		@total = @cart.total
		@amount = @cart.total * 100
		@card = params[:stripeToken]
		@payment = HandleStripePayment.new(current_user, @cart, @card, @user_products, @total, @amount, @brands)

		customer = @payment.create_customer
		charge = @payment.charge_card
		@payment.email_client
		@payment.email_supplier
		@payment.create_paid_item
		clear_cart!
	rescue Stripe::CardError => e
		flash[:danger] = e.message
		redirect_to root_path
	end

	end