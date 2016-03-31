module BrandManager
  class << self
def get_brands!(user, user_products)
    @user = user
    @cart = Cart.where(:user_id => @user.id).first
    @slots = @cart.slot.first
    @user_products = user_products
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
    return @brands
end
  end
end