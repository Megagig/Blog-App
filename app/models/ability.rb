class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # Guest user (not logged in)

    if user.role == 'admin'
      can :manage, :all # Admins can manage all resources
    else
      can :read, :all
      can [:create, :destroy], [Post, Comment], user_id: user.id
    end
  end
end
