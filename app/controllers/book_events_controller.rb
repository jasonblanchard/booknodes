class BookEventsController < ApplicationController
  def index
    @events = BookEvent.all
  end

  def show
    @event = BookEvent.find(params[:id])
    @ideas = @event.ideas
    @idea_list = @event.all_idea_nodes
  end

end
