class AccessPolicy
  include AccessGranted::Policy

  def configure

    role :global_admin, { is_global_admin: true } do
      can [:leagueadmin, :admin], User
      can [:leagueadmin, :admin], Team
      can [:leagueadmin, :admin], Group
    end

    role :league_admin, { is_league_admin: true } do
      can [:leagueadmin, :admin], User
      can [:leagueadmin, :admin], Team
      can [:leagueadmin, :admin], Group
    end

    role :team_admin do
      can :admin, Team do |team,user|
        user.team_id == team.id && user.team_admin == true
      end
    end

    role :player do
      can :create, Team
    end
  end
end