class HandleStripePayment
	attr_accessor :cart, :user_products, :total,
								:amount, :card, :brands, :current_user
								:customer
  def initialize(current_user, cart, card, user_products, total, amount, brands)
  	@current_user, @cart, @card, @user_products, @total, @amount, @brands = current_user, cart, card, user_products, total, amount, brands
  end

  def set_customer_id(customer)
  	@customer = customer
  end

  def create_customer
	  customer = Stripe::Customer.create(
				:email => @current_user.email,
				:card => @card
		)
		set_customer_id(customer)
		return customer
  end

  def charge_card
		charge = Stripe::Charge.create(
			:customer => @customer.id,
			:amount => @amount,
			:description => 'A customer',
			:currency => 'GBP'
		)
		return charge
  end

  def email_supplier
  	@brands.each do |brand|
			Email.checkout_notify_brand_email(brand, @user_products).deliver_now
		end
  end

  def email_client
		Email.checkout_email(@current_user, @user_products).deliver_now
  end

  def create_paid_item
		@user_products.each do |item|
			PaidItem.create( :brand_name => item.brand.name, :product_name => item.product_name, :brand_id => item.brand.id, :product_price => item.product_price, :product_id => item.id)
		end
  end
end