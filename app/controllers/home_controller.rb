class HomeController < ApplicationController

  def index
    @events = current_user.book_events
  end

end
