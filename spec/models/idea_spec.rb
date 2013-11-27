require 'spec_helper'

describe Idea do

  it { should validate_numericality_of :page }

  it 'can be created' do
    idea = FactoryGirl.build(:idea)
    idea.should be_a(Idea)
    idea.book_event.should be_a(BookEvent)
    idea.book_event.user.should be_a(User)
  end

  describe '#list_nodes' do

    it 'displays a list of uniq idea nodes' do
      event = FactoryGirl.build(:book_event_with_ideas)
      
      event.ideas[0].list_nodes.should eq("cats, dogs")
    end

  end

  describe '#split_node_string' do

    it 'splits a comma-delimited string of nodes into an array' do
      nodes = 'cats, dogs, and turtles'

      Idea.split_node_string(nodes).should match_array(['cats','dogs','and turtles'])
    end

  end

  describe '#split_nodes_from_note' do

    it 'can extract node values from the note between {curly brackets}' do
      Idea.split_nodes_from_note("This is a {sentence} with {two nodes}").should match_array(['sentence', 'two nodes'])
    end

    it 'can extract node values from the note with the #hashtag syntax' do
      Idea.split_nodes_from_note("This #sentence should have two #nodes").should match_array(['sentence', 'nodes'])
    end

  end

  describe '#remove_node_delimiter' do

    it 'removes curly braces {}' do
      Idea.remove_node_delimiter("This {string} has an idea").should eq "This string has an idea"
    end

    it 'removes #hashtag' do
      Idea.remove_node_delimiter("This #string has an idea").should eq "This string has an idea"
    end
  end

end
