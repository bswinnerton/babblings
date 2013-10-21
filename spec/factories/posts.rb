FactoryGirl.define do
  factory :post do
    trait :image do
      format 'image'
      content 'http://25.media.tumblr.com/6366ef0adce32aa104e01bf58a29ceca/tumblr_msnl3ayMxU1rsnzy2o5_500.jpg'
    end
    trait :youtube do
      format 'youtube'
      #original_path 'http://www.youtube.com/watch?v=kCCHn1cWhOg'
      content 'kCCHn1cWhOg'
    end
    trait :vimeo do
      format 'vimeo'
      #original_path 'https://vimeo.com/63502573'
      content '63502573'
    end
    trait :quote do
      format 'quote'
      sequence(:content) { |n| "#{n} bottles of beer on the wall" }
    end
    trait :spotify do
      format 'spotify'
      content 'spotify:track:4HujwzHGxXQ9BkrqW3lIfJ'
    end
    trait :soundcloud do
      format 'soundcloud'
      content 'https://soundcloud.com/radiohead/bloom_jamie-xx-rework-part-3'
    end
    trait :definition do
      format 'definition'
      content 'antidisestablishmentarianism'
    end

    trait :deleted do
      is_deleted true
    end
  end
end
