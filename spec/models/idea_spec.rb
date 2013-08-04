require 'spec_helper'

describe Idea do
  it 'can be created' do
    idea = FactoryGirl.create(:idea)
    idea.should be_a(Idea)
    idea.book_event.should be_a(BookEvent)
    idea.book_event.user.should be_a(User)
  end

  it 'can display a list of uniq idea nodes' do
    event = FactoryGirl.create(:book_event_with_ideas)
    
    event.ideas[0].list_nodes.should eq("cats, dogs")
  end
end
