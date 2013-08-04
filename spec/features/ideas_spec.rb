require 'spec_helper'

feature 'idea actions' do

  before :each do
    @event = FactoryGirl.create(:book_event_with_ideas)
  end

  scenario 'User visits the book event page to see all ideas' do
    visit book_event_path(@event)

    page.should have_content "Great book"
    page.should have_content "This is a great note"
    page.should have_content "felines are important"

  end

  scenario 'User can filter by clicking on nodes' do
    visit book_event_path(@event)

    click_link 'dogs: 1'

    page.should_not have_content 'felines are important'
  end

end

