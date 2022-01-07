class ApplicationController < ActionController::Base
  include ActionController::HttpAuthentication::Basic::ControllerMethods
  include Pagy::Backend

  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  protect_from_forgery with: :exception
  before_action :update_allowed_parameters, if: :devise_controller?

  def ensure_admin
    return if current_user.role.name == "admin"
    redirect_to root_path, alert: "You are not authorized for this action."
  end
  private

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(request.referrer || root_path)
  end

  protected

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys:[:name, :surname, :email, :password])
    devise_parameter_sanitizer.permit(:account_update, keys:[:name, :surname, :email, :password, :current_password])
  end
end
