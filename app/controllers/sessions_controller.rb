class SessionsController < ApplicationController
  def create

    # perform the user lookup or creation event
    @user = User.find_or_create_by(steamid: auth_hash[:uid])
    @user.personaname = auth_hash[:info][:nickname]
    @user.avatar = auth_hash[:info][:image]
    @user.loccountrycode = auth_hash[:info][:location]
    @user.profileurl = auth_hash[:info][:urls][:Profile]

    @user.save!

    session[:user_id] = @user.id
    redirect_to '/'
  end

  def logout

    reset_session
    @current_user = nil

    redirect_to root_path
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end
