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

  describe 'idea_nodes' do

    let(:event) { FactoryGirl.create(:book_event) }

    before :each do
      BookEvent.any_instance.stub(:idea_nodes).and_return ['cats','dogs','hobbits']
    end

    it 'lists idea nodes' do

      get :idea_nodes, :id => event.id , :format => :json

      JSON.parse(response.body).should =~ ['cats','dogs','hobbits']
    end
  end

end
