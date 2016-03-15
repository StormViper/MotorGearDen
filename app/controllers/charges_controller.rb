class ChargesController < ApplicationController
	def new
	end

	def create
		@amount = 2000

		customer = Stripe::Customer.create(
			:email => 'template@email.com',
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