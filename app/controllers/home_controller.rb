class HomeController < ApplicationController

  def index
    @events = current_user.book_events.recent if user_signed_in?
  end

end
