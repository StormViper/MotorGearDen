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
    create_cart_slots(@cart)
	end

	def create_cart_slots(cart)
    @slot = Slot.create(:cart_id => cart.id)
    @slot.save
    cart.slot_id = @slot.id
    cart.save
    send_registration_email
	end

	def send_registration_email
    Email.registration_email(@user).deliver_now
	end
end