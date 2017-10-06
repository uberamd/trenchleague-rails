class InHouseController < ApplicationController
  add_breadcrumb :index, :index_inhouse_path

  def show_match
  end

  def index
    @users = User.where.not(:in_house_elo => nil).order('in_house_elo DESC').all
  end
end
