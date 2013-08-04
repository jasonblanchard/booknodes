require 'spec_helper'

describe IdeasController do
  
  before :each do
    @event = FactoryGirl.create(:book_event_with_ideas)
  end


  describe 'create' do

    it 'assigns all the values' do

      post :create, "idea"=>{"note"=>"testing", "nodes"=>"catdog, wallaby"}, "book_event_id" => @event.id

      assigns[:event].id.should eq(@event.id)
      assigns[:idea].should be_a(Idea)
      assigns[:idea].note.should eq('testing')
      assigns[:idea].nodes.should eq(['catdog','wallaby'])
      assigns[:idea].book_event.id.should eq(@event.id)

    end

    it 'increases the ideas by 1' do

      expect { post :create, "idea"=>{"note"=>"testing", "nodes"=>"catdog, wallaby"}, "book_event_id" => @event.id }.to change{BookEvent.find(@event.id).ideas.count}.by(1)
      
    end

  end


end
