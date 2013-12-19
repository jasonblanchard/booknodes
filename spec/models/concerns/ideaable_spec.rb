require 'spec_helper'

describe Ideaable do
  
  let(:event) { FactoryGirl.build(:book_event_with_ideas) }
  let(:new_event) { FactoryGirl.build(:book_event) }

  describe '#tallied_idea_nodes' do
    it 'returns a list of ideas with frequency numbers' do
      event = FactoryGirl.create(:book_event_with_ideas)
      event.tallied_idea_nodes.should eq({"cats"=>2, "dogs"=>1})
    end
  end
  
  describe '#last_idea_page_number' do

    context 'when last idea has a page number' do
      it 'returns the last page number' do
        event.ideas.last.page = 12

        event.last_idea_page_number.should eq 12
      end
    end

    context 'when the last idea does not have page number' do
      it 'returns the page number of the last idea with a page number' do
        event.ideas.first.page = 12
        event.last_idea_page_number.should eq 12
      end
    end

    context 'when the book event does not have any ideas' do
    
      it 'returns nil' do
        new_event.last_idea_page_number.should eq nil
      end
    end

  end

  describe '#new_page_range' do

    it 'returns a new page range based on the last idea' do
      event.ideas.last.page = 10

      event.new_page_range.should =~ (10..30).to_a
    end

    it 'returns an empty array if the last idea does not have a page number' do
      event.new_page_range.should eq []
    end
  end

  describe '#idea_nodes' do

    it 'returns an array of unique idea nodes' do
      event.idea_nodes.should eq ['cats','dogs']
    end
  end
  
end
