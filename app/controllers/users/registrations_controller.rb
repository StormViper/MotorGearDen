class Users::RegistrationsController < Devise::RegistrationsController
# before_filter :configure_sign_up_params, only: [:create]
# before_filter :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
   def new
     super
   end

  # POST /resource
   def create
     @user = User.new(user_params)
     if @user.save
      CreateUser.new(@user)
      create_user_detail(@user)
      redirect_to root_path
     else
      p "USER FAILED LOGIN: #{@user.username}"
      render 'new'
     end
   end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  private

  def user_params
    params.require(:user).permit( :email, :password, :password_confirmation, :username, :picture )
  end

  def create_user_detail(user)
    @user = user
    @ud = UserDetail.new

    @ud.username = @user.username
    @ud.email = @user.email
    @ud.brand_id = @user.brand_id if @user.brand
    @ud.brand_website = @user.brand.website if @user.brand
    @ud.user_id = @user.id
    @ud.save!

    @user.user_detail_id = @ud.id
    @user.save!
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.for(:sign_up) << :attribute
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.for(:account_update) << :attribute
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
