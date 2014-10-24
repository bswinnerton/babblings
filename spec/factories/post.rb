# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :post do
    content 'http://25.media.tumblr.com/6366ef0adce32aa104e01bf58a29ceca/tumblr_msnl3ayMxU1rsnzy2o5_500.jpg'
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
