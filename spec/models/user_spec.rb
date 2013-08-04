require 'spec_helper'

describe User do
  it 'can be created' do
    FactoryGirl.create(:user).should be_a(User)
  end
end
