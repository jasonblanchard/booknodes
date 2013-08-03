class IdeasController < ApplicationController

  def show
    @idea = Idea.find(params[:id])
  end
  
  def new
    @event = BookEvent.find(params[:book_event_id])
  end

  def create
    @event = BookEvent.find(params[:book_event_id])
    @idea = @event.ideas.new(idea_params)

    @idea.nodes = @idea.nodes.split(',').map { |v| v.strip }

    @idea.save
  end

  def update
    @event = BookEvent.find(params[:book_event_id])
    @idea = @event.ideas.find(params[:id])

    @idea.update_attributes(idea_params)
    
    # TODO: This is making two UPDATE calls. Figure out how to do this better
    @idea.nodes = @idea.nodes.split(',').map { |v| v.strip }
    @idea.save
    
  end

  def destroy
    @event = BookEvent.find(params[:book_event_id])
    @idea = @event.ideas.find(params[:id])

    @idea.destroy

    redirect_to @event
  end

  private

  def idea_params
    params.require(:idea).permit(:note, :nodes)
  end

end
