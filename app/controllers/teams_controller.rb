class TeamsController < ApplicationController

  add_breadcrumb :index, :teams_path

  def new
    authorize! :create, Team

    @team = Team.new
  end

  def create
    authorize! :create, Team

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

    if current_user.id != nil
      OpendotaMmrRefreshJob.perform_later(current_user)
    end

    @avg_mmr = @team.get_average_mmr
    @wins = SeriesMatch.where(:winning_team_id => @team.id).all.count
    @losses = SeriesMatch.where(:losing_team_id => @team.id).all.count
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

    authorize! :admin, @team

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
    team = Team.friendly.find(params[:id])

    authorize! :admin, team
    user = User.find(params[:user])

    # user is not even trying to join this team
    if user.team_id != team.id
      flash[:danger] = "User #{user.personaname} has no pending request to join this team."
      redirect_to team and return
    end

    # reject the removal if the user holds status on the team -- should never happen unless people are
    # trying to spoof calls
    if user.team_id == team.id && user.team_join_approved
      flash[:danger] = "User #{user.personaname} is already approved for this team."
      redirect_to team and return
    end

    user.team_id = nil
    user.team_join_approved = false
    user.team_join_approved_by = nil
    user.team_join_date = nil
    user.team_captain = false
    user.team_admin = false
    user.smurf_check = 0

    user.save!
    redirect_to team and return
  end

  def smurf_check
    @team = Team.friendly.find(params[:id])

    authorize! :leagueadmin, Team

    user = User.find(params[:user])

    # verify the user is even on this team
    if user.team_id != @team.id && user.team_join_approved
      flash[:danger] = "User #{user.personaname} can't be modified, isn't on #{@team.name}"
      redirect_to @team and return
    end

    # do stuff now
    case params[:smurfaction]
      when 'approve'
        user.smurf_check = 1
        flash[:success] = "User #{user.personaname} has been APPROVED for play"
      when 'deny'
        user.smurf_check = 2
        flash[:success] = "User #{user.personaname} has been DENIED for play"
      when 'reset'
        user.smurf_check = 0
        flash[:success] = "User #{user.personaname} has had their smurf check status reset"
      else
        flash[:danger] = "Something wen't wrong, cannot handle smurfaction #{params[:smurfaction]} on user #{user.personaname}"
    end

    user.save!
    redirect_to @team and return
  end

  def index

  end

  private

  def team_params
    params.require(:team).permit(:name, :logo)
  end
end
