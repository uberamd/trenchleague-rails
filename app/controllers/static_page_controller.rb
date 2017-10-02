class StaticPageController < ApplicationController
  include StaticPageHelper

  def index
    @mmr_hash = league_averages
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
end
