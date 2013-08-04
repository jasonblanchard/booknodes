# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    password "testpass"
    sequence(:email) {|n| "email#{n}@apprennet.com" }
  end
end
