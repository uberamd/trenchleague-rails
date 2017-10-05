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

  def staff
    @staff = Page.where(:shortname => 'staff').all.first

    if @staff.nil?
      @staff = Page.new
    end
  end
end
