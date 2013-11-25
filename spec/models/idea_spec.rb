require 'spec_helper'

describe Idea do

  it { should validate_numericality_of :page }

  it 'can be created' do
    idea = FactoryGirl.build(:idea)
    idea.should be_a(Idea)
    idea.book_event.should be_a(BookEvent)
    idea.book_event.user.should be_a(User)
  end

  it 'can display a list of uniq idea nodes' do
    event = FactoryGirl.build(:book_event_with_ideas)
    
    event.ideas[0].list_nodes.should eq("cats, dogs")
  end

  it 'can split a comma-delimited string of nodes into an array' do
    nodes = 'cats, dogs, and turtles'

    Idea.split_node_string(nodes).should match_array(['cats','dogs','and turtles'])
  end

  it 'can extract node values from the note between {curly brackets}' do
    Idea.split_nodes_from_note("This is a {sentence} with {two nodes}").should match_array(['sentence', 'two nodes'])
  end

end
