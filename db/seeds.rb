# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# user = User.create(username: "tonim", password: "verysecurepassword", age: 39)

# Setlist.create([
#     { name: 'Setlist 1'}, 
#     { name: 'Setlist 2'}, 
#     { name: 'Setlist 3'}
# ])

Song.create([
    {name: 'Hello', artist: 'Adele', lyrics: 'Hello, its me I was wondering if after all these years youd like to meet To go over everything'}, 
    {name: 'Gold Dust Woman', artist: 'Fleetwood Mac', lyrics: 'Rock on gold dust woman Take your silver spoon Dig your grave'}, 
    {name: 'Play God', artist: 'Ani DiFranco', lyrics: 'I was done at 16 Showing up for class I was out there in the ring'}
])