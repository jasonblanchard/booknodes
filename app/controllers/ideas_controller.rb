class IdeasController < ApplicationController
  
  def new
    @event = BookEvent.find(params[:book_event_id])
  end

  def create
    @event = BookEvent.find(params[:book_event_id])
    @idea = @event.ideas.new(idea_params)

    @idea.save
  end

  private

  def idea_params
    params.require(:idea).permit(:note, :nodes)
  end

end
