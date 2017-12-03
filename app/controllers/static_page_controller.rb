class StaticPageController < ApplicationController
  include StaticPageHelper
  include RankTierHelper

  def index
    @tier_hash = league_averages
    get_rank_tier_player_distribution
  end

  def rules
    @rules = Page.where(:shortname => 'rules').all.first

    if @rules.nil?
      @rules = Page.new
    end
  end

  def changelog
    # nothing here
  end

  def staff
    @staff = Page.where(:shortname => 'staff').all.first

    if @staff.nil?
      @staff = Page.new
    end
  end

  def distributions
    @rank_hash = get_rank_tier_player_distribution
  end
end
