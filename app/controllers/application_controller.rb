class ApplicationController < ActionController::Base
  include Pundit::Authorization
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorizer_error


  before_action :configure_permitted_parameters, if: :devise_controller?
  after_action :verify_authorized, except: [:index]
  after_action :verify_policy_scoped, only: :index

  protected

  def user_not_authorizer_error(exception)
    flash[:alert] = "User not authorized to perform this action"
    redirect_to root_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password)}
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :email, :password, :current_password)}
  end
end
