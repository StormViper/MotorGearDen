class Email < ApplicationMailer
	default from: "aparker@stormeronline.net"

	def registration_email(user)
		@user = user
		mail(to: @user.email, subject: 'Welcome to MotorGearDen')
	end
end
