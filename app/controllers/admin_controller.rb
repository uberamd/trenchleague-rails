class AdminController < ApplicationController
  include AdminHelper

  def index
    authorize! :leagueadmin, Group
    # do something here idk what yet
  end

  def autocomplete_user_personaname
    authorize! :leagueadmin, Group

    response_hash = []

    User.all.each do |user|

      response_hash << {
          id: user.id,
          name: user.personaname
      }
    end

    render json: response_hash
  end

  def inhouse
    authorize! :leagueadmin, Group
    @users = User.where.not(:is_banned => true, :is_deleted => true).order('personaname ASC').all
  end

  def create_inhouse_match
    authorize! :leagueadmin, Group

    @ihm = InhouseMatch.create(inhouse_match_params)
    @ihm.save!

    user_arr = []
    params.each do |param,v|
      next if v == '' # we want to

      tmp_user = { :elo => 1000, :user_id => 0, :won => false }
      if param =~ /^winner_/
        tmp_user[:won] = true
      end

      if param =~ /^(winner_|loser_)/
        user = User.find_by(personaname: v)
        tmp_user[:user_id] = user.id
        if !user.in_house_elo.nil?
          tmp_user[:elo]     = user.in_house_elo
        end
        user_arr << tmp_user
      end
    end

    updated_user_arr = calculate_elo(user_arr)
    updated_user_arr.each do |user|
      user_obj = User.find(user[:user_id])

      original_elo = user_obj.in_house_elo
      user_obj.in_house_elo = user[:updated_elo]
      if user[:won]
        user_obj.in_house_wins += 1
      else
        user_obj.in_house_losses += 1
      end

      user_obj.save!

      @ihm.inhouse_match_players.create({
          user_id: user_obj.id,
          starting_elo: original_elo,
          elo_change: user[:elo_change]
                                        })

    end

    flash[:success] = 'Successfully recorded results for Inhouse Match'
    redirect_to inhouse_admin_path and return
  end

  def update_player_inhouse
    authorize! :leagueadmin, Group

    @user = User.find(params[:id])
    @user.update!(update_player_inhouse_params)
  end

  def update_player_admin
    authorize! :leagueadmin, User

    @user = User.find(params[:id])
    @user.update!(update_player_params)
  end

  def images
    authorize! :leagueadmin, Group

    @images = GenericUpload.where(:is_deleted => false).all
  end

  def upload_images
    authorize! :leagueadmin, Group

    @image = GenericUpload.create(image_upload_params)

    @image.user_id = current_user.id
    @image.save!

    flash[:success] = 'File successfully uploaded.'
    redirect_to images_admin_path and return
  end

  def seed_series
    authorize! :leagueadmin, Group

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
          tmp_target_begin_date = Date.strptime(params["start_#{series}".parameterize.underscore.to_sym], "%m/%d/%Y")
          tmp_target_end_date = Date.strptime(params["end_#{series}".parameterize.underscore.to_sym], "%m/%d/%Y")
          new_series.target_begin_date = tmp_target_begin_date
          new_series.target_end_date = tmp_target_end_date
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

  def players
    authorize! :leagueadmin, Group

    @users = User.order('personaname').all
    @settings = LeagueSetting.all.first
  end

  def settings
    authorize! :leagueadmin, Group

    @settings = LeagueSetting.all.first
    if @settings.nil?
      @settings = LeagueSetting.create
    end
  end

  def update_settings
    authorize! :leagueadmin, Group

    if LeagueSetting.all.count == 0
      @settings = LeagueSetting.create(league_settings_params)
    else
      @settings = LeagueSetting.all.first
      @settings.update(league_settings_params)
      @settings.save!
    end

    flash[:success] = 'League settings successfully updated.'
    redirect_to league_settings_path and return
  end

  def rules
    authorize! :leagueadmin, Group

    if Page.where(:shortname => 'rules').all.count == 0
      Page.create(:shortname => 'rules')
    end

    @rules = Page.where(:shortname => 'rules').all.first
  end

  def update_page
    authorize! :leagueadmin, Group

    @page = Page.where(:shortname => params[:shortname]).all.first

    @page.contents = params[:contents]
    @page.user_id = current_user.id
    @page.save

    flash[:success] = "Page #{params[:shortname]} updated successfully."
    redirect_to "/admin/#{params[:shortname]}" and return
  end

  def staff
    authorize! :leagueadmin, Group

    if Page.where(:shortname => 'staff').all.count == 0
      Page.create(:shortname => 'staff')
    end

    @staff = Page.where(:shortname => 'staff').all.first
  end

  private

  def create_group_params
    params.permit(:name)
  end

  def league_settings_params
    params.require(:league_setting).permit(:team_cost_usd, :payment_description, :allow_payments, :rank_tier_ceiling, :max_players, :max_teams, :max_players_per_team, :allow_team_creation, :allow_player_registration)
  end

  def image_upload_params
    params.require(:generic_upload).permit(:image)
  end

  def inhouse_match_params
    params.require(:inhouse_match).permit(:screenshot, :match_id)
  end

  def update_player_inhouse_params
    params.require(:user).permit(:in_house_wins, :in_house_losses, :in_house_elo)
  end

  def update_player_params
    params.require(:user).permit(:team_captain, :is_league_admin, :is_league_caster, :is_banned)
  end

end
