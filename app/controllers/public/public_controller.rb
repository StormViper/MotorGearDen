class Public::PublicController < ApplicationController
	def homepage
			@products = Product.all
	end
end