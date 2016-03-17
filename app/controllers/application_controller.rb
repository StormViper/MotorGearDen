class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!, if: :devise_controller?
  before_filter :configure_permitted_parameters, if: :devise_controller?
  helper_method :user_is_admin?, :authenticate_admin!, :product_available?, :get_user_products!, :get_user_total!, :clear_cart!

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
    @slots = @cart.slots.first
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

def get_user_total!
@total = 0
    @cart = Cart.where(:user_id => current_user.id).first if user_signed_in?
    @slots = @cart.slots.first
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

def clear_cart!
  @cart = current_user.carts.first
  @slots = @cart.slots.first
  @slots.slot_one = nil
  @slots.slot_two = nil
  @slots.slot_three = nil
  @slots.slot_four = nil
  @slots.slot_five = nil

  @slots.slot_six = nil
  @slots.slot_seven = nil
  @slots.slot_eight = nil
  @slots.slot_nine = nil
  @slots.slot_ten = nil
  @slots.save
  @cart.cart_count = 0
  @cart.save
end
end
