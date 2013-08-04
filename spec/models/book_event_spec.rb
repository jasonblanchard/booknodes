require 'spec_helper'

describe BookEvent do
  before :all do
    @event = FactoryGirl.create(:book_event)
  end

  it 'can be created' do
    FactoryGirl.create(:book_event).should be_a(BookEvent)
  end

  it 'returns a list of idea nodes with frequency numbers' do
    event = FactoryGirl.create(:book_event_with_ideas)
    
    event.all_idea_nodes.should eq({"cats"=>2, "dogs"=>1})

  end
end
