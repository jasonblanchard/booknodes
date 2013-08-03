class BookEventsController < ApplicationController
  def index
    @events = BookEvent.all
  end

  def show
    @event = BookEvent.find(params[:id])
    @ideas = @event.ideas
  end

end
