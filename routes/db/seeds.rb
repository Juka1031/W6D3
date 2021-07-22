# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ArtworkShare.destroy_all
Artwork.destroy_all
User.destroy_all


james  = User.create!(username: 'James')
julian = User.create!(username: 'Julian')
julia  = User.create!(username: 'Julia')

art1 = Artwork.create!(title: 'Starry Knight', image_url: 'tinyurl.com/SK', artist_id: james.id)
art2 = Artwork.create!(title: 'Lisa Mona', image_url: 'tinyurl.com/LM', artist_id: julian.id)
art3 = Artwork.create!(title: 'Creation of Eve', image_url: 'tinyurl.com/CE', artist_id: julian.id)
art4 = Artwork.create!(title: 'The Seventeenth Chaple', image_url: 'tinyurl.com/SC', artist_id: julia.id)

share1 = ArtworkShare.create!(artwork_id: art1.id, viewer_id: julian.id)
share2 = ArtworkShare.create!(artwork_id: art1.id, viewer_id: julia.id)
share3 = ArtworkShare.create!(artwork_id: art2.id, viewer_id: james.id)
share4 = ArtworkShare.create!(artwork_id: art3.id, viewer_id: james.id)

comment1 = Comment.create!(user_id: james.id, artwork_id: art4.id, body: 'Wow! So good!')
comment2 = Comment.create!(user_id: james.id, artwork_id: art3.id, body: 'Wow! Kinda good...')
comment3 = Comment.create!(user_id: julian.id, artwork_id: art1.id, body: 'Oof! So bad!')
comment4 = Comment.create!(user_id: julia.id, artwork_id: art1.id, body: 'Yeah...it needs work...')

likes1 = Like.create!(user_id: james.id, likeable_id:comment2.id, likeable_type:"Comment")
likes2 = Like.create!(user_id: julian.id, likeable_id:art1.id, likeable_type:"Artwork")
likes3 = Like.create!(user_id: julia.id, likeable_id:comment3.id, likeable_type:"Comment")
likes4 = Like.create!(user_id: julia.id, likeable_id:art3.id, likeable_type:"Artwork")
likes5 = Like.create!(user_id: james.id, likeable_id:art3.id, likeable_type:"Artwork")