class BookEventsController < ApplicationController
  def index
    @events = BookEvent.all
  end

  def show
    @event = BookEvent.find(params[:id])
    
    if params[:node]
      @ideas = @event.ideas.order_by(:created_at => :desc).to_a.keep_if { |idea| idea.nodes.include?(params[:node]) }
    else
      @ideas = @event.ideas.order_by(:created_at => :desc).to_a
    end

    @idea_list = @event.all_idea_nodes
  end

end
