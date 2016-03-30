# Preview all emails at http://localhost:3000/rails/mailers/email
class EmailPreview < ActionMailer::Preview
		def registration_email_preview
			Email.registration_email(User.first)
		end

		def checkout_email_preview
		@user = User.first
    @cart = Cart.where(:user_id => @user.id).first
    @slots = @cart.slot.first
    @slot_list = [@slots.slot_one, @slots.slot_two, @slots.slot_three, @slots.slot_four, @slots.slot_five,
                  @slots.slot_six, @slots.slot_seven, @slots.slot_eight, @slots.slot_nine, @slots.slot_ten]
    @user_products = []
    @product = []
    @slot_list.each do |item|
    if item.nil?
        p 'Item empty'
      else        
        @product << item
    end
    end
      @product.each do |item|
      items = Product.where(:product_id => item).first
      @user_products << items
    end
    	@products = []
 			@user_products.each do |item|
 				if item.nil?
 				else
 					@products << item
 				end
 			end
			Email.checkout_email(User.first, @products)
		end

    def checkout_notify_brand_preview
    @user = User.first
    @cart = Cart.where(:user_id => @user.id).first
    @slots = @cart.slot.first
    @slot_list = [@slots.slot_one, @slots.slot_two, @slots.slot_three, @slots.slot_four, @slots.slot_five,
                  @slots.slot_six, @slots.slot_seven, @slots.slot_eight, @slots.slot_nine, @slots.slot_ten]
    @user_products = []
    @product = []

    @slot_list.each do |item|
    if item.nil?
        p 'Item empty'
      else        
        @product << item
    end
    end
      @product.each do |item|
      items = Product.where(:product_id => item).first
      @user_products << items
    end
      @products = []
      @user_products.each do |item|
        if item.nil?
        else
          @products << item
        end
      end
    @brands = []

    @user_products.each do |p|
      @brands << p.brand
    end

    @brands = @brands.uniq

    Email.checkout_notify_brand_email(User.first, @products)
    end
end
