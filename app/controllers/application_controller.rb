class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # The current_user function returns the first user object

  # def current_user
  #   @current_user ||= User.first
  # end

  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name bio photo email password password_confirmation])
  end
end
