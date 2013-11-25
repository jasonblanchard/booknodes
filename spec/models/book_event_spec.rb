require 'spec_helper'

describe BookEvent do
  before :all do
    @event = FactoryGirl.create(:book_event)
  end

  it 'can be created' do
    FactoryGirl.create(:book_event).should be_a(BookEvent)
  end

end
