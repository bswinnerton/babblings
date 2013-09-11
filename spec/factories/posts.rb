FactoryGirl.define do
  factory :post do
    format 'image'
    original_path 'http://25.media.tumblr.com/6366ef0adce32aa104e01bf58a29ceca/tumblr_msnl3ayMxU1rsnzy2o5_500.jpg'
    content 'http://25.media.tumblr.com/6366ef0adce32aa104e01bf58a29ceca/tumblr_msnl3ayMxU1rsnzy2o5_500.jpg'
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
