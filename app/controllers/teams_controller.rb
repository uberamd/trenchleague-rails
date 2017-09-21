class TeamsController < ApplicationController

  add_breadcrumb :index, :teams_path

  def new
    @team = Team.new
  end

  def create
    # first we're going to create and save the team
    @team = Team.create(team_params)
    @team.save!

    # next we're going to associate the player with the team
    current_user.team_id = @team.id
    current_user.team_admin = true
    current_user.team_captain = true
    current_user.save!

    # success
    flash[:success] = 'New team registration successful'
    redirect_to @team and return
  end

  def show
    @team = Team.friendly.find(params[:id])
    add_breadcrumb @team.name
  end

  def index

  end

  private

  def team_params
    params.require(:team).permit(:name, :logo)
  end
end
