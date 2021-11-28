class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # before_action :respond_to_js
  before_action :update_allowed_parameters, if: :devise_controller?


  # def respond_to_js
    # respond_to { |format| format.js }
  # end

  protected

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password)}
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :email, :password, :current_password)}
  end

  # private

end
