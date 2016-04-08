class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!, if: :devise_controller?
  before_filter :configure_permitted_parameters, if: :devise_controller?
  helper_method :user_is_admin?, :authenticate_admin!, :product_available?, :get_user_products!, :get_user_total!, :clear_cart!,
                :user_is_brand?, :get_brands!, :authenticate_brand!, :get_total!, :get_total_after!

protected
  def configure_permitted_parameters
  	devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:username, :email, :password, :password_confirmation, :remember_me) }
  	devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:login, :username, :password, :remember_me) }
  	devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:username, :email, :password, :password_confirmation, :current_password) }
  end

  def user_is_admin?
    current_user.admin? if user_signed_in?
  end

  def authenticate_admin!
    if user_signed_in?
      if !current_user.admin?
        flash[:danger] = "You need to be an admin to use this feature!"
        redirect_to root_path
      end
    else
      flash[:danger] = "You need to be an admin to use this feature!"
      redirect_to root_path
  end
end

def product_available?(product)
  @product = product
  if @product.product_price == 0.0
    false
  else
    true
  end
end

def get_user_products!
    @cart = Cart.where(:user_id => current_user.id).first if user_signed_in?
    @slots = @cart.products
    @user_products = []
    @product = []
    @slots.each do |item|
    if item.nil?
        p 'Item empty'
      else        
        @product << item
    end
    end
      @product.each do |item|
      items = Product.where(:product_id => item.id).first
      @user_products << item
    end
    return @user_products
end

def get_user_total!
    @total = 0
    @cart = Cart.where(:user_id => current_user.id).first if user_signed_in?
    @slots = @cart.products
    @user_products = []
    @product = []
    @slots.each do |item|
    if item.nil?
        p 'Item empty'
      else        
        @product << item
    end
    end
    @product.each do |item|
      items = Product.where(:product_id => item.id).first
      @user_products << item
    end
    @user_products.each do |p|
      @total += p.product_price
    end
    return @total
end

def clear_cart!
  @cart = current_user.cart
  @cart.products = []
  @cart.cart_count = 0
  @cart.save
end

def user_is_brand?
  current_user.is_brand? if user_signed_in?
end

def get_brands!(user, user_products)
    @user = user
    @cart = Cart.where(:user_id => @user.id).first
    @slots = @cart.products
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

def authenticate_brand!
    if user_signed_in?
      if !current_user.is_brand?
        flash[:danger] = "You need to be a brand owner to use this feature!"
        redirect_to root_path
      end
    else
      flash[:danger] = "You need to be a brand owner to use this feature!"
      redirect_to root_path
  end
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
end
