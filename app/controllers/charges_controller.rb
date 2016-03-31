class ChargesController < ApplicationController
	before_action :authenticate_user!
	def new
		@cart = Cart.where(:user_id => current_user.id).first if user_signed_in?
		@user_products = UserManager.get_user_products!(current_user.id)
		@total = UserManager.get_user_total!(current_user)

		@cart.total = @total
		@cart.save!
	end

	def create
		@user_products = UserManager.get_user_products!(current_user.id)
		@cart = current_user.cart
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

		Email.checkout_email(current_user, @user_products).deliver

		@brands = BrandManager.get_brands!(current_user, @user_products)
		@brands.each do |brand|
			Email.checkout_notify_brand_email(brand, @user_products).deliver_now
		end

		@user_products.each do |item|
			PaidItem.create( :brand_name => item.brand.name, :product_name => item.product_name, :brand_id => item.brand.id, :product_price => item.product_price, :product_id => item.id)
		end
		clear_cart!
	rescue Stripe::CardError => e
		flash[:danger] = e.message
		redirect_to root_path
	end

	end