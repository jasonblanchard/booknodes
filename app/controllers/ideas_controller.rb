class IdeasController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:update]

  def show
    @idea = Idea.find(params[:id])
  end
  
  def new
    @event = BookEvent.find(params[:book_event_id])
  end

  def create
    @event = BookEvent.find(params[:book_event_id])
    @idea = @event.ideas.new(idea_params)

    if @idea.save

      respond_to do |format|
        format.html { render :nothing => true }
        format.js
      end
    
    end

  end

  def update
    @event = BookEvent.find(params[:book_event_id])
    @idea = @event.ideas.find(params[:id])

    @idea.update_attributes(idea_params)

    if @idea.save
      respond_to do |format|
        format.html { redirect_to @event }
        format.js
      end
    end
    
  end

  def destroy
    @event = BookEvent.find(params[:book_event_id])
    @idea = @event.ideas.find(params[:id])

    @idea.destroy

    redirect_to @event
  end

  private

  def idea_params
    params.require(:idea).permit(:note, :nodes, :page).tap do |whitelisted|
      whitelisted[:nodes] = Idea.split_node_string(whitelisted[:nodes])
    end
  end

end
