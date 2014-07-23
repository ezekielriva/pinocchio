class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

  helper_method :current_user

private

  def current_user
    @current_user ||= User.where(auth_token: cookies[:auth_token]).first if cookies[:auth_token].present?
  end  

end
