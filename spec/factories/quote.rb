# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :quote do
    content "Life is what happens when you're busy making other plans."
    type 'Quote'
  end
end
