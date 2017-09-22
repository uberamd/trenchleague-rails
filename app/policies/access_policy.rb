class AccessPolicy
  include AccessGranted::Policy

  def configure

    role :global_admin, { is_global_admin: true } do
      can :manage, User
      can :manage, Team
    end

    role :player do
      can :create, Team

      can [:update], Team do |team, user|
        user.team_id == team.id && user.team_admin == true
      end
    end
  end
end