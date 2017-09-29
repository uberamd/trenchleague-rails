class StaticPageController < ApplicationController
  include StaticPageHelper

  def index
    @mmr_hash = league_averages
  end
end
