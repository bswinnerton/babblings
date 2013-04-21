# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Post.create!([
{
  content: 'http://i.imgur.com/meilraK.gif'
},
{
  content: 'spotify:track:5iqtsXxZGiN31wlVcbMyaZ'
},
{
  content: 'http://www.youtube.com/watch?feature=player_embedded&v=3gTf-wBUSgM'
},
{
  content: 'http://vimeo.com/63653873'
},
{
  content: 'Life is what happens when you make other plans my friend.'
}
])
