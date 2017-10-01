class SchedulesController < ApplicationController

  add_breadcrumb :index, :schedules_path

  def index
    @upcoming_series = Series.where.not(:completed => true, :scheduled_date => nil).order('scheduled_date ASC').all
    @completed_series = Series.where(:completed => true).order('updated_at ASC').all
  end
end
