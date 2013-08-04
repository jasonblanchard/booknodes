# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :idea do
    note "This is a great note"
    nodes "life, the universe, everything"
    book_event
  end

end
