class AccessPolicy
  include AccessGranted::Policy

  def configure

    role :global_admin, { is_global_admin: true } do
      can [:leagueadmin, :admin], User
      can [:leagueadmin, :admin], Team
      can [:leagueadmin, :admin], Group
      can [:leagueadmin, :admin, :cast], Series
    end

    role :league_admin, { is_league_admin: true } do
      can [:leagueadmin, :admin], User
      can [:leagueadmin, :admin], Team
      can [:leagueadmin, :admin], Group
      can [:leagueadmin, :admin, :cast], Series
    end

    role :team_admin do
      can :admin, Team do |team,user|
        user.team_id == team.id && user.team_admin == true
      end

      can :scheduleseries, Series do |series,user|
        (user.team_id == series.teams[0].id || user.team_id == series.teams[1].id) && user.team_captain == true
      end
    end

    role :caster, { is_league_caster: true } do
      can [:cast], Series
    end

    role :player do
      can :create, Team do |team,user|
        !user.id.nil? && user.team_id.nil?
      end

      can [:playinhouse], User do |user|
        !user.id.nil?
      end
    end

  end
end