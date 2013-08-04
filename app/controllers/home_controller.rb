class HomeController < ApplicationController

  def index
    @events = current_user.book_events if user_signed_in?
  end

end
