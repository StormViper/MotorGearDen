class Email < ApplicationMailer
	default from: "aparker@stormeronline.net"

	def registration_email(user)
		@user = user
		mail(to: @user.email, subject: 'Welcome to MotorGearDen')
	end

	def checkout_email(user, user_products)
		@user = user
		@user_products = user_products
		mail(to: @user.email, subject: 'Thank you for your purchase')
	end
end
