class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!, if: :devise_controller?
  before_filter :configure_permitted_parameters, if: :devise_controller?
  helper_method :authenticate_admin!, :product_available?, :authenticate_brand!

  include BrandManager
  include UserManager
  include CartManager
protected
  def configure_permitted_parameters
  	devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:username, :email, :password, :password_confirmation, :remember_me) }
  	devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:login, :username, :password, :remember_me) }
  	devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:username, :email, :password, :password_confirmation, :current_password) }
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

end
