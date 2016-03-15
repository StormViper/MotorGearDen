class Member::UsersController < ApplicationController
	def show
		@user = User.find(params[:id])
		@imageholder = User.where(:email => "adam3692@image.com").first
	end

	def edit
		@user = User.new
	end
end