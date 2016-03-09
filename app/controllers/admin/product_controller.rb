class Admin::ProductController < ApplicationController
	before_action :authenticate_admin!
	def new
		@product = Product.new
	end

	def create
		@product = Product.new(product_params)

		if @product.save
			p "NEW PRODUCT ADDED: #{@product.product_name} | PRODUCT ID: #{@product.id}"
			redirect_to root_path
		else
			p 'FAILED TO ADD PRODUCT!'
			render 'new'
		end
	end

private

	def product_params
		params.require(:product).permit(:product_id, :product_name, :product_description, :image_url, :product_price)
	end
end