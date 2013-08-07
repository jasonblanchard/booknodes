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

    it 'pull nodes from the note' do
      post :create, "idea"=>{"note"=>"This {note} has {idea nodes} in it with {cats}.", "nodes"=>"catdog, note"}, "book_event_id" => @event.id

      assigns[:idea].nodes.should match_array(['note','idea nodes','catdog', 'cats'])
      assigns[:idea].note.should eq "This note has idea nodes in it with cats."
    end

  end

  describe 'update' do

    before :each do
      @idea = @event.ideas.create(:note => "Cats are great", :nodes => 'cats beards')
    end

    it 'should assign values' do
      
      put :update, :idea => {'note' => 'Cats are wonderful', :nodes => 'cats, bears' }, :book_event_id => @event.id, :id => @idea.id

      assigns[:event].id.should eq(@event.id)
      assigns[:idea].id.should eq(@idea.id)
    end

    it 'should update the values' do
      put :update, 'idea' => {'note' => 'Cats are wonderful', 'nodes' => 'cats, bears' }, 'book_event_id' => @event.id, 'id'=> @idea.id

      idea = @event.ideas.find(@idea.id)

      assigns[:idea].note.should eq 'Cats are wonderful'
      assigns[:idea].nodes.should eq ['cats','bears']
    end

  end

  describe 'delete' do

    it 'should delete an idea' do

      expect { delete :destroy, :book_event_id => @event.id, :id => @event.ideas[0].id }.to change{BookEvent.find(@event.id).ideas.count}.by(-1)

    end
  end

end
