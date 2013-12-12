class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)

    can [:create, :update, :destroy], Idea, :book_event => { :user_id => user.id }

  end
end
