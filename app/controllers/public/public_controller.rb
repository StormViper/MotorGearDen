class Public::PublicController < ApplicationController
	def homepage
			@products = Product.all
		if user_signed_in?
      if current_user.brand_id.nil? 
        p "#{current_user.username}(#{current_user.id}) is not registered with a brand."
        if current_user.is_brand? == true
          p "Removing brand status from #{current_user.username}(#{current_user.id})"
          current_user.toggle! :is_brand?
        end
      else
      	if current_user.is_brand? == false
      		p "Updating is_brand for user: #{current_user.username}(#{current_user.id}) which is registered to the brand: #{current_user.brand.name}"
        	current_user.toggle! :is_brand?
      	else
      		p "#{current_user.username}(#{current_user.id}) is registered with the brand: #{current_user.brand.name})"
      	end
      end
    end
	end
end