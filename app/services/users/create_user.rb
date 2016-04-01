class CreateUser
	attr_accessor :user
	def initialize(user)
		@user = user
		create_user_cart
	end

	def create_user_cart
    @cart = Cart.create(:user_id => @user.id, :cart_count => 0)
    @cart.save
    @user.cart_id = @cart.id
    @user.save
	end

	def send_registration_email
    Email.registration_email(@user).deliver_now
	end
end