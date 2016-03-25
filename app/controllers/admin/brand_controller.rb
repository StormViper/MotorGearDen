class Admin::BrandController < ApplicationController
	before_action :authenticate_admin!
	def new
		Rails.logger.info "*****The user #{current_user.username} just accessed the create brand page is s/he an admin?: #{current_user.admin?}*****"
		@brand = Brand.new
	end

	def menu
		@brands = Brand.search(params[:search]).paginate(:page => params[:page], :per_page => 10)
		@brand = Brand.new
	end

	def edit
		@brand = Brand.find(params[:format])
	end

	def create
		@brand = Brand.new(brand_params)
		@last_brand = Brand.last
		Brand.last.nil? ? @brand.brand_id = 1 : @brand.brand_id = @last_brand.brand_id + 1
		
		if @brand.save
			flash[:success] = "Successfully created brand"
			if @brand.user_id
				user = User.find(@brand.user_id)
				user.brand_id = @brand.brand_id
				user.save!
				@brand.save!
			end
			redirect_to root_path
		else
			flash[:danger] = "Failed to create brand!"
			render 'new'
		end
	end

	def update
	end

	def destroy
		@brand = Brand.find(params[:format])
		@brand.destroy!
		flash[:danger] = "#{@brand.name} has been destroyed by agent #{current_user.username}"
		redirect_to root_path
	end

private
	def brand_params
		params.require(:brand).permit(:name, :email, :description, :website, :brand_id, :user_id)
	end
end