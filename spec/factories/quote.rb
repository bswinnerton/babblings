# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :quote do
    sequence(:content) { |n| "Life is what happens when you're busy making other plans. #{n}" }
    type 'Quote'
  end
end
