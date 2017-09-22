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
    current_user.team_join_approved = true
    current_user.team_join_approved_by = current_user.id
    current_user.team_join_date = Time.now()
    current_user.save!

    # success
    flash[:success] = 'New team registration successful'
    redirect_to @team and return
  end

  def show
    @team = Team.friendly.find(params[:id])
    add_breadcrumb @team.name
  end

  def join_request
    @team = Team.friendly.find(params[:id])

    current_user.team_id = @team.id
    current_user.team_join_approved = false
    current_user.save!

    flash[:success] = "You have requested to join team #{@team.name}. This requires approval of an admin or captain."
    redirect_to @team and return
  end

  def join_approve
    @team = Team.friendly.find(params[:id])

    # check to see if the logged in user is on the current team
    if current_user.team_id != @team.id
      flash[:danger] = "You are not a member of team #{@team.name}."
      redirect_to @team and return
    end

    if !current_user.team_admin || !current_user.team_captain
      flash[:danger] = 'You do not have the required permissions to approve join requests.'
      redirect_to @team and return
    end

    # ok, we have permissions to do this action, lets do
    user = User.find(params[:user])

    # reject the request if the user isn't trying to join the team
    if user.team_id != @team.id
      flash[:danger] = "User #{user.personaname} has no pending request to join this team."
      redirect_to @team and return
    end

    # reject the request if the user is already on the team
    if user.team_id == @team.id && user.team_join_approved
      flash[:danger] = "User #{user.personaname} is already on this team."
    end

    # finally join the user to the team
    user.team_join_approved = true
    user.team_join_approved_by = current_user.id
    user.team_join_date = Time.now()
    user.save!

    flash[:success] = "User #{user.personaname} is now a member of #{@team.name}!"
    redirect_to @team and return
  end

  def join_reject
    @team = Team.friendly.find(params[:id])

    # check to see if the logged in user is on the current team
  end

  def index

  end

  private

  def team_params
    params.require(:team).permit(:name, :logo)
  end
end
