class UsersController < ApplicationController
  before_action :authenticate_user!
  def index
    @users = User.order('created_at DESC').paginate(page: params[:page], per_page: 30)
  end
  
end