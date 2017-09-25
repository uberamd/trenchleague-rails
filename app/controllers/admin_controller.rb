class AdminController < ApplicationController

  def index
    # do something here idk what yet
  end

  def groups
    authorize! :leagueadmin, Group

    # this is where we handle groups
    @groups = Group.all
  end

  def groups_create
    authorize! :leagueadmin, Group

    @group = Group.create(create_group_params)
    @group.save!

    flash[:success] = "Group #{@group.name} created successfully"
    redirect_to groups_admin_path and return
  end

  def groups_delete
    authorize! :leagueadmin, Group

    @group = Group.find(params[:group_id])
    @group.delete

    flash[:success] = 'Group successfully deleted'
    redirect_to groups_admin_path and return
  end

  def groups_update_assignments
    authorize! :leagueadmin, Group

    params.each do |p,v|
      if p =~ /^team_/
        team_id = p.gsub(/team_/, '') # strip team_ from the param
        team = Team.find(team_id)
        team.group_id = v
        team.save!
      end
    end

    redirect_to groups_admin_path and return
  end

  private

  def create_group_params
    params.permit(:name)
  end
end
