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
    content: 'http://s3.amazonaws.com/s3.babblin.gs/posts/images/000/000/260/large/tumblr_msnl3ayMxU1rsnzy2o5_1280.jpg',
    original_path: 'http://s3.amazonaws.com/s3.babblin.gs/posts/images/000/000/260/large/tumblr_msnl3ayMxU1rsnzy2o5_1280.jpg',
    width: 960,
    height: 962,
    is_deleted: false
  },
  {
    user_id: 1,
    format: 'image',
    content: 'http://s3.amazonaws.com/s3.babblin.gs/posts/images/000/000/257/large/24ekOAH.jpg',
    original_path: 'http://s3.amazonaws.com/s3.babblin.gs/posts/images/000/000/257/large/24ekOAH.jpg',
    width: 960,
    height: 1280,
    is_deleted: false
  },
  {
    user_id: 1,
    format: 'image',
    content: 'http://s3.amazonaws.com/s3.babblin.gs/posts/images/000/000/248/large/tumblr_mqeom2a2oU1qbltjyo2_1280.jpg',
    original_path: 'http://s3.amazonaws.com/s3.babblin.gs/posts/images/000/000/248/large/tumblr_mqeom2a2oU1qbltjyo2_1280.jpg',
    width: 960,
    height: 960,
    is_deleted: false
  },
  {
    user_id: 1,
    format: 'image',
    content: 'http://s3.amazonaws.com/s3.babblin.gs/posts/images/000/000/244/large/3CjBFlN.jpg',
    original_path: 'http://s3.amazonaws.com/s3.babblin.gs/posts/images/000/000/244/large/3CjBFlN.jpg',
    width: 960,
    height: 607,
    is_deleted: false
  },
  {
    user_id: 1,
    format: 'image',
    content: 'http://s3.amazonaws.com/s3.babblin.gs/posts/images/000/000/241/large/OoRsR42.gif',
    original_path: 'http://s3.amazonaws.com/s3.babblin.gs/posts/images/000/000/241/large/OoRsR42.gif',
    width: 960,
    height: 960,
    is_deleted: false
  }
])
