class Admin::CategoryController < ApplicationController
	def new
		Rails.logger.info "*****The user #{current_user.username} just accessed the create category page is s/he an admin?: #{current_user.admin?}*****"
		@category = Category.new
	end

	def create
		@category = Category.new(category_params)
		if @category.save
			flash[:success] = "Added category successfully"
			redirect_to root_path
		else
			flash[:danger] = "Error occured please try again"
			render 'new'
		end
	end

	def destroy
	end

private

	def category_params
		params.require(:category).permit(:name)
	end	
end