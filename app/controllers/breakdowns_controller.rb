class BreakdownsController < ApplicationController

  before_filter :setup_context

  def index
    @breakdowns = @event.breakdowns

    respond_to do |format|
      format.json { render :json => @breakdowns }
    end
  end

  private

  def setup_context
    @event = BookEvent.find(params[:book_event_id])
  end

  def book_event_params
    params.require(:breakdown).permit(:nodes, :note)
  end

end
