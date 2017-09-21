class ApplicationController < ActionController::Base
  # commented out per https://github.com/omniauth/omniauth/issues/237
  #protect_from_forgery with: :exception

  rescue_from AccessGranted::AccessDenied do |exception|
    redirect_to root_path, alert: "You don't have permissions to access this page."
  end

  helper_method :current_user

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
