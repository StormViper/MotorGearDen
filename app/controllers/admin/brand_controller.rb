class Admin::BrandController < ApplicationController
	before_action :authenticate_admin!, except: [:show]
	before_action :authenticate_brand!, only: [:show]
	def new
		Rails.logger.info "*****The user #{current_user.username} just accessed the create brand page is s/he an admin?: #{current_user.admin?}*****"
		@brand = Brand.new
	end

	def show
		@brand = Brand.find(params[:id])
		@sold = PaidItem.where("brand_name LIKE ? AND brand_id LIKE ?", @brand.name, @brand.id)
		@total = BrandManager.get_total!(@sold)
		@details = BrandManager.get_total_after!(@total, @brand)
	end

	def menu
		@brands = Brand.search(params[:search])
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
			redirect_to brand_menu_path
		else
			flash[:danger] = "Failed to create brand!"
			render 'new'
		end
	end

	def update
		@brand = Brand.where(user_id: params[:brand][:user_id]).first
		if @brand.update(brand_params)
			flash[:success] = "Saved brand settings"
			redirect_to brand_menu_path
		else
			flash[:danger] = "Error occured please check settings"
			redirect_to brand_menu_path
		end
	end

	def destroy
		@brand = Brand.find(params[:format])
		@brand.destroy!
		flash[:danger] = "#{@brand.name} has been destroyed by agent #{current_user.username}"
		redirect_to root_path
	end

private
	def brand_params
		params.require(:brand).permit(:name, :email, :description, :website, :brand_id, :user_id, :percentage)
	end
end