class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)

    can :admin, Band do |band|
      user.has_admin?(band)
    end

  end
end