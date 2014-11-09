# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :picture do
    sequence(:content) { |n| "http://placehold.it/#{n*100}x#{n*100}" }
    type 'Picture'
  end
end
