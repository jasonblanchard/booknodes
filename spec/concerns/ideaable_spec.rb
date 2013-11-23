require 'spec_helper'

describe Ideaable do
  
  let(:event) { FactoryGirl.create(:book_event_with_ideas) }
  
  describe '#last_idea_page_number' do

    it 'returns the last page number when last idea has a page number' do
      event.ideas.last.page = 12

      event.last_idea_page_number.should eq 12
    end

    it 'returns something else if the last idea does not have a page number' do
      event.last_idea_page_number.should eq nil
    end

  end

  describe '#new_page_range' do

    it 'returns a new page range based on the last idea' do
      event.ideas.last.page = 10

      event.new_page_range.should =~ [10,11,12,13,14,15,16,17,18,19,20]
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
