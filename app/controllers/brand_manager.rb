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

def get_total_after!(total, brand)
  @brand = brand
  @per_length = @brand.percentage.to_s.length
  case @per_length
  when 1
    @percentage = "0.0#{@brand.percentage}".to_f
  when 2
    @percentage = "0.#{@brand.percentage}".to_f
  when 3
    @percentage = "1".to_f
  else
    @percentage = "0".to_f
  end
  @total_before = total
  @commission = @total_before * @percentage
  @total_after = @total_before - @commission 


  details = {"total_after" => @total_after, "commission" => @commission}
  return details
end

def get_total!(sold)
  @total_numbers = []
  @total = 0
  sold.each do |item|
    @total_numbers << item.product_price
  end
  @total_numbers.each do |num|
    @total += num
  end
  return @total.to_f
end
  end
end