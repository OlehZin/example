class UsersController < ApplicationController
  
  before_action :authenticate_user!
  #before_action :require_admin!
  
  def index
    @users = User.all 
	end

	def show
    @user = resource
	end

  def edit 
    @user = resource
  end

  def create
    @user = User.create(user_params)
    redirect_to root_path
  end

  def update
    @user = resource
    redirect_to root_path if @user.update_attributes(user_params)
  end
  
  def destroy
    resource
    @user.destroy
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

  def resource
    @user = User.find(params[:id])
  end  
end
