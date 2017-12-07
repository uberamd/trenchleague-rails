class ApplicationController < ActionController::Base
  # commented out per https://github.com/omniauth/omniauth/issues/237
  #protect_from_forgery with: :exception

  rescue_from AccessGranted::AccessDenied do |exception|
    redirect_to root_path, alert: "You don't have permissions to access this page."
  end

  helper_method :current_user

  private

  def current_user
    if cookies.signed[:user_id]
      if @current_user
        if @current_user.is_banned
          flash[:danger] = 'You have been banned from this site.'
          session[:user_id] = nil
          cookies.signed[:user_id] = nil
          User.new
        else
          @current_user
        end
      else
        tmp_user = User.find(cookies.signed[:user_id])
        if tmp_user.is_banned
          flash[:danger] = 'You have been banned from this site. You can only view public portions of this site.'
          cookies.signed[:user_id] = nil
          User.new
        else
          @current_user = tmp_user
        end
      end
    else
      User.new
    end
  end
end
