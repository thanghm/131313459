class UsersController < ApplicationController
  before_action :authenticate_user!
  def index
    @users = User.order('created_at DESC').paginate(page: params[:page], per_page: 30)
  end

  def searchuser
    @user_find = User.all
    @user_find = User.where(nil)
    filtering_params_user(params).each do |key, value|
      @user_find = @user_find.public_send(key, value) if value.present?
    end
  end

  private

  def filtering_params_user(params)
    params.slice(:skill, :location)
  end
  
end