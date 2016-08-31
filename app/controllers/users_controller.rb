class UsersController < ApplicationController
	before_action :require_user, only: [:show]
	before_action :require_super, only: [:index]
	before_action :require_owner, only: [:edit]
	
	def index
		@users = User.all
	end

	def show
		@user = User.find(params[:id])
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			session[:user_id]=@user.id
			redirect_to '/'
		else
			redirect_to '/signup'
		end
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if @user.update_attributes(user_params)
		redirect_to profile_path, notice: "User info updated successfully!"
		else
		render 'edit'
		end	
	end

	def destroy 
		@user = User.find(params[:id])
		@user.destroy
		redirect_to "/", alert: "User destroyed successfully!"
	end
	
	private
	def user_params
		params.require(:user).permit(:first_name, :last_name, :email, :password, :role)
	end
end
