class Admin::AffiliateController < ApplicationController
	before_action :authenticate_admin!
	def new
		Rails.logger.info "*****The user #{current_user.username} just accessed the create affiliate page is s/he an admin?: #{current_user.admin?}*****"
		@affiliate = Affiliate.new
	end

	def create
		@affiliate = Affiliate.new(affiliate_params)
		@is_enabled = params[:is_enabled?]
		if @is_enabled = '1'
			@affiliate.toggle! :is_enabled?
		end
		if @affiliate.save
			flash[:success] = "Affiliate created"
			redirect_to root_path
		else
			flash[:danger] = 'Error: Please try again'
			render 'new'
		end
	end

	def destroy
	end

private

def affiliate_params
	params.require(:affiliate).permit(:name, :image_url, :link_url, :is_enabled?)
end
end