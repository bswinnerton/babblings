# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :post do
    sequence(:content) { |n| "http://placehold.it/#{n*100}x#{n*100}" }
    type 'Picture'

    factory :picture do
    end

    factory :quote do
    end

    factory :spotify do
    end

    factory :vimeo do
    end

    factory :youtube do
    end

  end
end
