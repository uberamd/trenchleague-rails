class PlayersController < ApplicationController
  include RankTierHelper
  include PlayersHelper

  def index

  end

  def show
    @player = User.find_by(steamid: params[:id])
    @rank_info = nil

    if !@player.rank_tier.nil?
      @rank_info = get_rank_tier_hash(@player.rank_tier)
    end

    # get successful heroes
    tmp_heroes = @player.user_heroes.where('games > ?', 19)
    @top_heroes = tmp_heroes.sort_by {|x|
      ((x.win.to_f / x.games.to_f) * 100).round
    }.reverse!.slice(0,9)

    safe = @player.odota_win_loss_records.find_by(lane_role: 1)
    if !safe.nil?
      if safe['lose'] > 0
        @safe_win_pct = ( (safe['win'].to_f / (safe['win'].to_f + safe['lose'].to_f)) * 100).round
      else
        @safe_win_pct = 100
      end
    end

    mid = @player.odota_win_loss_records.find_by(lane_role: 2)
    if !mid.nil?
      if mid['lose'] > 0
        @mid_win_pct = ( (mid['win'].to_f / (mid['win'].to_f + mid['lose'].to_f)) * 100).round
      else
        @mid_win_pct = 100
      end
    end

    off = @player.odota_win_loss_records.find_by(lane_role: 3)
    if !off.nil?
      if off['lose'] > 0
        @off_win_pct = ( (off['win'].to_f / (off['win'].to_f + off['lose'].to_f)) * 100).round
      else
        @off_win_pct = 100
      end
    end

    jungle = @player.odota_win_loss_records.find_by(lane_role: 4)
    if !jungle.nil?
      if jungle['lose'] > 0
        @jungle_win_pct = ( (jungle['win'].to_f / (jungle['win'].to_f + jungle['lose'].to_f)) * 100).round
      else
        @jungle_win_pct = 100
      end
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
    params.require(:user).permit(:email, :inhouse, :position, :free_agent, :biography)
  end
end
