require 'spec_helper'

describe BookEventsController do

  describe 'show' do

    before :each do
      @event = FactoryGirl.create(:book_event_with_ideas)
    end

    it 'assigns @ideas' do

      get :show, :id => @event

      assigns(:event).should eq(@event)
    end

    it 'renders show template' do

      get :show, :id => @event

      response.should render_template :show

    end

    it 'filters @ideas with :node param' do

      get :show, :id => @event, :node => 'cats'

      assigns(:ideas).length.should be(2)
    end
  
  end

end
