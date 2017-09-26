class AdminController < ApplicationController

  add_breadcrumb :index, :admin_path

  def index
    # do something here idk what yet
  end

  def seed_series
    authorize! :leagueadmin, Group
    add_breadcrumb :groups, :groups_admin_path
    add_breadcrumb 'Seed Series'

    @groups = Group.all

    @groups_seeded = {}
    @rounds = {}
    @groups.each do |group|
      tmp_team_arr = []
      group.teams.each do |team|
        tmp_team_arr.push(team.name)
      end

      tmp_team_arr.push(nil) if tmp_team_arr.size.odd?
      rounds = tmp_team_arr.size - 1
      matches_per_round = tmp_team_arr.size / 2

      tmp_rounds = {}
      rounds.times do |index|
        tmp_rounds[index+1] = []
        matches_per_round.times do |match_index|
          tmp_rounds[index+1] << [tmp_team_arr[match_index], tmp_team_arr.reverse[match_index]]
        end

        tmp_team_arr = [tmp_team_arr[0]] + tmp_team_arr[1..-1].rotate(-1)
      end
      @rounds["#{group.name}"] = tmp_rounds
      @groups_seeded["#{group.name}"] = tmp_team_arr
    end

    @seeds_sorted = Hash.new{ |h, k| h[k] = { } }
    @rounds.each do |group,rounds|
      # here we iterate over groups
      rounds.each do |round,v|
        # here we are iterating over each round
        @seeds_sorted["#{round}"]["#{group}"] = v
      end
    end
  end

  def seed_series_update
    authorize! :leagueadmin, Group

    @groups = Group.all

    @groups_seeded = {}
    @rounds = {}
    @groups.each do |group|
      tmp_team_arr = []
      group.teams.each do |team|
        tmp_team_arr.push(team.id)
      end

      tmp_team_arr.push(nil) if tmp_team_arr.size.odd?
      rounds = tmp_team_arr.size - 1
      matches_per_round = tmp_team_arr.size / 2

      tmp_rounds = {}
      rounds.times do |index|
        tmp_rounds[index+1] = []
        matches_per_round.times do |match_index|
          tmp_rounds[index+1] << [tmp_team_arr[match_index], tmp_team_arr.reverse[match_index]]
        end

        tmp_team_arr = [tmp_team_arr[0]] + tmp_team_arr[1..-1].rotate(-1)
      end
      @rounds["#{group.name}"] = tmp_rounds
      @groups_seeded["#{group.name}"] = tmp_team_arr
    end

    @seeds_sorted = Hash.new{ |h, k| h[k] = { } }
    @rounds.each do |group,rounds|
      # here we iterate over groups
      rounds.each do |round,v|
        # here we are iterating over each round
        @seeds_sorted["#{round}"]["#{group}"] = v
      end
    end

    # iterate over all of the series (1, 2, 3, 4 etc)
    @seeds_sorted.each do |series,series_value|
      series_value.each do |group,group_value|
        group_value.each do |matchup|
          new_series = Series.new
          new_series.target_begin_date = params["start_#{series}".parameterize.underscore.to_sym]
          new_series.target_end_date = params["end_#{series}".parameterize.underscore.to_sym]
          new_series.save!

          new_series.team_series.create([{
              :team_id => matchup[0]
                                         }, {
              :team_id => matchup[1]
                                         }])
        end
      end
    end

    flash[:success] = 'Series successfully seeded'
    redirect_to groups_admin_path and return
  end

  def groups
    authorize! :leagueadmin, Group

    add_breadcrumb 'Groups'

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

    if @group.teams.count > 0
      flash[:danger] = "You cannot delete group #{@group.name}, there are still teams in this group."
      redirect_to groups_admin_path and return
    end

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
