# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :idea do
    note "This is a great note"
    nodes "life, the universe, everything"
    book_event

    factory :idea1 do
    end

    factory :idea2 do
      nodes "life, death, cats"
    end

    factory :idea3 do
      nodes "life"
    end

  end

end
