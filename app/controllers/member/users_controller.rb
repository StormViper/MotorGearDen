class Member::UsersController < ApplicationController
	def show
		@user = User.find(params[:id])
		@imageholder = User.where(:email => "adam3692@image.com").first
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])

		if @user.update(user_params)
			flash[:success] = "Saved profile settings"
			redirect_to user_path(@user)
		else
			flash[:danger] = "Error occured please check settings"
			render 'edit'
		end
	end

	def update_address
		@user = User.find(current_user.id)

		if @user.update(address_params)
			flash[:success] = "Saved address settings"
			redirect_to root_path
		else	
			flash[:danger] = "Error occured please re-check your input"
			render 'new'
		end
	end

	def destroy
		@user = User.find(params[:id])
		@user.destroy!
		flash[:success] = "Account successfully destroyed :( we hope you come back"
		redirect_to root_path
	end

private

def user_params
	params.require(:user).permit(:email, :password, :picture)
end

def address_params
	params.require(:user).permit(:door_name_numner, :street, :city, :borough, :postcode)
end
end