class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # The current_user function returns the first user object

  def current_user
    @current_user ||= User.first
  end
end
