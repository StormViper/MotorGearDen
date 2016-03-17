class Admin::ProductController < ApplicationController
	before_action :authenticate_admin!
	def new
		@product = Product.new
	end

	def create
		@product = Product.new(product_params)
		@last_product = Product.last
		Product.last.nil? ? @product.product_id = 1 : @product.product_id = @last_product.product_id + 1

		if @product.save
			p "NEW PRODUCT ADDED: #{@product.product_name} | PRODUCT ID: #{@product.id}"
			redirect_to root_path
		else
			p 'FAILED TO ADD PRODUCT!'
			render 'new'
		end
	end

	def destroy
		@product = Product.find(params[:format])
		@product.destroy!
		flash[:danger] = "The product #{@product.product_name}, has been silently disposed by Agent #{current_user.username}"
		redirect_to root_path
	end

private

	def product_params
		params.require(:product).permit(:product_id, :product_name, :product_description, :picture, :product_price, :brand_id)
	end
end