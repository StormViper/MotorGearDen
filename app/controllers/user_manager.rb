module UserManager
  class << self

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
  end
end