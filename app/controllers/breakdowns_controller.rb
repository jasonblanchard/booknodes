class BreakdownsController < ApplicationController

  before_filter :setup_context

  def index
    @breakdowns = @event.breakdowns
  end

  private

  def setup_context
    @event = BookEvent.find(params[:book_event_id])
  end

  def book_event_params
    params.require(:breakdown).permit(:nodes)
  end

end
