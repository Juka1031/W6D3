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

art1 = Artwork.create!(title: 'Starry Knight', image_url: 'tinyurl.com/SK', artist_id: 1)
art2 = Artwork.create!(title: 'Lisa Mona', image_url: 'tinyurl.com/LM', artist_id: 2)
art3 = Artwork.create!(title: 'Creation of Eve', image_url: 'tinyurl.com/CE', artist_id: 2)
art4 = Artwork.create!(title: 'The Seventeenth Chaple', image_url: 'tinyurl.com/SC', artist_id: 3)

share1 = ArtworkShare.create!(artwork_id: 1, viewer_id: 2)
share2 = ArtworkShare.create!(artwork_id: 1, viewer_id: 3)
share3 = ArtworkShare.create!(artwork_id: 2, viewer_id: 1)
share4 = ArtworkShare.create!(artwork_id: 3, viewer_id: 1)