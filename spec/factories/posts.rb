FactoryGirl.define do
  factory :post do
    trait :image do
      format 'image'
      content 'image:http://25.media.tumblr.com/6366ef0adce32aa104e01bf58a29ceca/tumblr_msnl3ayMxU1rsnzy2o5_500.jpg'
    end
    trait :youtube do
      format 'youtube'
      content 'youtube:http://www.youtube.com/watch?v=kCCHn1cWhOg'
    end
    trait :vimeo do
      format 'vimeo'
      content 'vimeo:https://vimeo.com/63502573'
    end
    trait :quote do
      format 'quote'
      content 'quote:You are on a rock floating through space'
    end
    trait :spotify do
      format 'spotify'
      content 'spotify:spotify:track:4HujwzHGxXQ9BkrqW3lIfJ'
    end
    trait :soundcloud do
      format 'soundcloud'
      content 'soundcloud:https://soundcloud.com/radiohead/bloom_jamie-xx-rework-part-3'
    end
    trait :definition do
      format 'definition'
      content 'definition:antidisestablishmentarianism'
    end

    width 500
    height 501
    trait :valid do
      is_deleted false
    end
    trait :deleted do
      is_deleted true
    end
  end
end
