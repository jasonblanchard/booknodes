require 'spec_helper'

describe BookEvent do

  it 'can be created' do
    FactoryGirl.build(:book_event).should be_a(BookEvent)
  end

end
