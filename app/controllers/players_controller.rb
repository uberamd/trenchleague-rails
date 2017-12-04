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
end
