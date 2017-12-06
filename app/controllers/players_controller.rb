class PlayersController < ApplicationController
  include RankTierHelper

  def index

  end

  def show
    @player = User.find_by(steamid: params[:id])
    @rank_info = nil

    if !@player.rank_tier.nil?
      @rank_info = get_rank_tier_hash(@player.rank_tier)
    end
  end

  def settings
    authorize! :isplayer, current_user
  end

  def update_settings
    authorize! :isplayer, current_user

    current_user.update_attributes(settings_params)

    flash[:success] = 'Profile updated successfully'
    redirect_to show_player_path(current_user.steamid)
  end

  private

  def settings_params
    params.permit(:email, :inhouse, :position, :free_agent, :biography)
  end
end
