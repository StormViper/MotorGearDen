class Admin::AffiliateController < ApplicationController
	before_action :authenticate_admin!
	def new
		Rails.logger.info "*****The user #{current_user.username} just accessed the create affiliate page is s/he an admin?: #{current_user.admin?}*****"
		@affiliate = Affiliate.new
	end

	def menu
		@affiliates = Affiliate.search(params[:search])
		@affiliate = Affiliate.new
	end

	def edit
		@affiliate = Affiliate.find(params[:format])
	end

	def update
		@affiliate = Affiliate.where(name: params[:affiliate][:name]).first
		@is_enabled = params[:affiliate][:is_enabled]
		if @is_enabled = 0 && @affiliate.is_enabled?
			@affiliate.toggle! :is_enabled?
		else
			if @is_enabled = 1 && !@affiliate.is_enabled?
				@affiliate.toggle! :is_enabled?
			end
		end
		if @affiliate.update(affiliate_params)
			flash[:success] = "Saved affiliate settings"
			redirect_to affiliate_menu_path
		else
			flash[:danger] = "Error occured please check settings"
			redirect_to affiliate_menu_path
		end
	end

	def create
		@affiliate = Affiliate.new(affiliate_params)
		@is_enabled = params[:is_enabled?]
		if @is_enabled = '1'
			@affiliate.toggle! :is_enabled?
		end
		if @affiliate.save
			flash[:success] = "Affiliate created"
			redirect_to affiliate_menu_path
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
