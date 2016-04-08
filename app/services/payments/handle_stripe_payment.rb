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
  	ud = @current_user.user_detail
	  customer = Stripe::Customer.create(
	  		:description => @current_user.username,
				:email => @current_user.email,
				:card => @card,
				:shipping => {
					:address => {
						:line1 => ud.address_line_one + ' ' + ud.address_line_two,
						:city => ud.address_line_three,
						:line2 => ud.address_line_four,
						:postal_code => ud.address_line_five,
					},
					:name => ud.first_name + ' ' + ud.last_name,
				},
		)
		set_customer_id(customer)
		return customer
  end

  def charge_card
  	ud = @current_user.user_detail
		charge = Stripe::Charge.create(
			:customer => @customer.id,
			:amount => @amount,
			:description => "The customer #{@current_user.username} bought a product!",
			:currency => 'GBP',
			:receipt_email => @current_user.email,
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