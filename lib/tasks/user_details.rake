task :update_details => :environment do
	@user = User.all
		@user.each do |u|
		@ud = u.user_detail

		@ud.username = u.username
		@ud.email = u.email

		@ud.address_line_one = u.door_name_number
		@ud.address_line_two = u.street
		@ud.address_line_three = u.city
		@ud.address_line_four = u.borough
		@ud.address_line_five = u.postcode

		
		if u.is_brand?
			if @ud.is_brand?
			else
				@ud.toggle :is_brand?
			end
		end
		@ud.brand_name = u.brand.name if u.brand
		@ud.brand_email = u.brand.email if u.brand
		@ud.brand_website = u.brand.website if u.brand
		@ud.save!
	end

end
