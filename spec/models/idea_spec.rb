require 'spec_helper'

describe Idea do
  it 'can be created' do
    idea = FactoryGirl.create(:idea)

    idea.should be_a(Idea)
  end
end
