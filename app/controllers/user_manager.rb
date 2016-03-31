module UserManager
  class << self

    def user_signed_in?(current_user)
      !!current_user
    end

def get_user_products!(current_user)
    @cart = Cart.where(:user_id => current_user).first
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
    return @user_products
end

def get_user_total!(current_user)
    @total = 0
    @cart = Cart.where(:user_id => current_user.id).first if user_signed_in?(current_user)
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
    @user_products.each do |p|
      @total += p.product_price
    end
    return @total
end

def user_is_brand?(current_user)
  current_user.is_brand? if user_signed_in?(current_user)
end

def user_is_admin?(current_user)
  current_user.admin? if user_signed_in?(current_user)
end

  end
end