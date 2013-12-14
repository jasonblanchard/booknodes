class BookEventsController < ApplicationController
  def index
    @events = BookEvent.all
  end

  def show
    @event = BookEvent.find(params[:id])
    @page_range = @event.new_page_range
    
    if params[:node]
      @ideas = @event.ideas.recent.with_node(params[:node]).page(params[:page])
    else
      @ideas = @event.ideas.recent.page(params[:page])
    end

    @idea_list = @event.tallied_idea_nodes
    @node_list = @event.idea_nodes
  end

  def new
    @event = BookEvent.new

    render :layout => 'application'
  end

  def create
    @event = current_user.book_events.new(book_event_params)

     authorize! :create, @event

    @event.save

    redirect_to root_path
  end

  def idea_nodes
    @event = BookEvent.find(params[:id])
    @nodes = @event.idea_nodes

    if @event
      respond_to do |format|
        format.json { render :json => @nodes }
      end
    end
  end

  private

  def book_event_params
    params.require(:book_event).permit(:title)
  end

end
