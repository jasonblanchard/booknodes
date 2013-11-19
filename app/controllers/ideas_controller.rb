class IdeasController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:update, :create]

  def show
    @idea = Idea.find(params[:id])
  end
  
  def new
    @event = BookEvent.find(params[:book_event_id])
  end

  def create
    @event = BookEvent.find(params[:book_event_id])
    @idea = @event.ideas.new(idea_params)
    @idea_list = @event.all_idea_nodes
    @page_range = @event.new_page_range

    if @idea.save

      respond_to do |format|
        format.html { render :nothing => true }
        format.js
      end
    
    end
    
    # TODO: Add a fail_create JS action

  end

  def update
    @event = BookEvent.find(params[:book_event_id])
    @idea = @event.ideas.find(params[:id])

    @idea.update_attributes(idea_params)

    @idea_list = @event.all_idea_nodes

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

    if @idea.destroy
      respond_to do |format|
        format.html { redirect_to @event }
        format.js
      end
    end

  end

  private

  def idea_params
    params.require(:idea).permit(:note, :nodes, :page, :image).tap do |whitelisted|
      whitelisted[:nodes] = combine_node_sources(whitelisted)
      whitelisted[:note] = Idea.remove_node_delimiter(whitelisted[:note])
    end
  end

  def combine_node_sources(params)
    process_node_param(params[:nodes]).concat(process_nodes_from_note(params[:note])).map { |v| v.strip }.uniq
  end

  def process_node_param(nodes)
    Idea.split_node_string(nodes)
  end

  def process_nodes_from_note(note)
    Idea.split_nodes_from_note(note)
  end

end
