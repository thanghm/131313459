class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def create
    @users = User.new
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.build(current_user)
  end

  def update
    if current_user.update(user_params)
      flash[:notice] = "User information updated"
      redirect_to edit_user_registration_path
    else
      flash[:error] = "Invalid user information"
      redirect_to edit_user_registration_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end