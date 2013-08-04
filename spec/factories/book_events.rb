# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :book_event do
    title "Great book"
    user

    factory :book_event_with_ideas do
      ideas { [ FactoryGirl.build(:idea, :nodes => ['cats','dogs']), FactoryGirl.build(:idea, :nodes => ['cats']) ] }
      # {"cats"=>2, "dogs"=>1}
    end

  end
end
