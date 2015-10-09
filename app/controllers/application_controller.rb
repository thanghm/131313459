class ApplicationController < ActionController::Base
  require 'cancan'
  before_action :configure_permitted_parameters, if: :devise_controller?

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to main_app.root_path, :alert => exception.message
  end

  rescue_from ActiveRecord::RecordNotFound do
    flash[:notice] = 'Resource not found.'
    redirect_back_or root_path
  end

  def redirect_back_or(path)
    redirect_to request.referer || path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:username, :email, :password, :password_confirmation, :remember_me, :address, :phone, :avatar, roles: []) }
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:login, :username, :email, :password, :remember_me) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:username, :skill, :fullname, :about, :letter, :email, :password, :password_confirmation, :address, :phone, :current_password, :avatar, roles: []) }
  end
end