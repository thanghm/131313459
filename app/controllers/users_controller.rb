class UsersController < ApplicationController
  
  def index
    @users = User.order('created_at DESC').paginate(page: params[:page], per_page: 30)
  end

  def new
    @user = User.new(user_params)

    if @user.save
      render :json => {:success => true}
      redirect_to @user
    else
      render :json => {:success => false}
    end
  end
  
  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)

    if @user.save
      render :json => {:success => true}
      redirect_to @user
    else
      render :json => {:success => false}
    end
  end
  
  def update
    @user = User.find(params[:id])

    if @user.update(post_params)
      flash[:notice] = "User was updated."
      redirect_to edit_user_registration_path
    else
      flash[:error] = "Please try again."
      redirect_to edit_user_registration_path
    end
  end

  def destroy
    @user = User.find(params[:id])

    if @user.destroy
      flash[:notice] = "User was deleted successfully."
      redirect_to :index
    else
      flash[:error] = "There was an error deleting the user."
      redirect_to :index
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end