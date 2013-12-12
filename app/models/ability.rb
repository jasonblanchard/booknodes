class Ability
  include CanCan::Ability

  #TODO: Add functional tests for book events

  def initialize(user)
    user ||= User.new # guest user (not logged in)

    can [:create, :update, :destroy], Idea, :book_event => { :user_id => user.id }
    can [:create, :update, :destroy], BookEvent, :user_id => user.id

  end
end
