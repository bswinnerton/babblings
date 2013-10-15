# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Post.create([
  {
    user_id: 1,
    format: 'image',
    content: 'http://25.media.tumblr.com/6366ef0adce32aa104e01bf58a29ceca/tumblr_msnl3ayMxU1rsnzy2o5_500.jpg'
  },
  {
    user_id: 1,
    format: 'youtube',
    content: 'kCCHn1cWhOg',
  },
  {
    user_id: 1,
    format: 'vimeo',
    content: '63502573',
  },
  {
    user_id: 1,
    format: 'quote',
    content: 'You are on a rock floating through space',
  },
  {
    user_id: 1,
    format: 'spotify',
    content: 'spotify:track:4HujwzHGxXQ9BkrqW3lIfJ',
  },
  {
    user_id: 1,
    format: 'soundcloud',
    content: 'https://soundcloud.com/radiohead/bloom_jamie-xx-rework-part-3',
  },
  {
    user_id: 1,
    format: 'definition',
    content: 'antidisestablishmentarianism',
  }
])
