class ApplicationController < ActionController::Base
  include Pundit
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :authenticate_user!
  before_action :perform_authorization, unless: :devise_controller?
  before_action :configure_permitted_parameters, if: :devise_controller?

  # Enforces access right checks for individuals resources
  after_filter :verify_authorized, unless: :devise_controller?

  # Enforces access right checks for collections
  #after_filter :verify_policy_scoped, :only => :index

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:username, :email, :password, :password_confirmation, :remember_me) }
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:login, :username, :email, :password, :remember_me) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:username, :email, :password, :password_confirmation, :current_password) }
  end

  def perform_authorization
    if params[:controller] == "dashboard" and params[:action] == "index"
      authorize current_user, :dashboard?
    else
      authorize current_user, "#{params[:controller]}:#{params[:action]}?"
    end
  end

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(request.referrer || root_path)
  end
end
